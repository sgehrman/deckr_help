import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

// ========================================================
//
//   To translate all the files, run this
//
//   $ dart ./translator_tool.dart
//
//   or
//
//   $ ./tools/translate - from the root
//
// ========================================================

void main() {
  Translator.start();
}

const arbDirPath = '../arb';

class Translator {
  static Future<void> start() async {
    final englishMap = _arbMap('en');

    const encoder = JsonEncoder.withIndent('  ');

    final languageCodes = [
      // 'en',
      'ja',
      'es',
      'de',
      'fr',
      'it',
      'zh',
      'cs',
      'da',
      'fi',
      'nl',
      'ru',
      'sv',
    ];

    for (final languageCode in languageCodes) {
      // make a copy
      final sourceMapCopy = Map<String, String>.of(englishMap);

      final existingMap = _arbMap(languageCode);

      for (final item in sourceMapCopy.entries) {
        if (item.key == '@@locale') {
          // fill in languageCode, it's 'en' since starting with english file
          sourceMapCopy[item.key] = languageCode;
        } else if (item.key.startsWith('@')) {
          // sourceMapCopy already copied above, just skip
          // sourceMapCopy[item.key] = englishMap[item.key] ?? '';
        } else {
          final existing = existingMap[item.key] ?? '';

          // don't translate if already translated
          if (existing.isNotEmpty && englishMap[item.key] != existing) {
            sourceMapCopy[item.key] = existing;
          } else {
            sourceMapCopy[item.key] = await _translate(
              item.value,
              languageCode,
            );
          }
        }
      }

      final destName = 'app_$languageCode.arb';
      final destFile = File('$arbDirPath/$destName');

      if (!destFile.existsSync()) {
        destFile.createSync(recursive: true);
      }

      print('Saving: ${destFile.path}');
      destFile.writeAsStringSync('${encoder.convert(sourceMapCopy)}\n');
    }
  }

  static Map<String, String> _arbMap(String languageCode) {
    final filename = 'app_$languageCode.arb';
    final file = File('$arbDirPath/$filename');

    if (file.existsSync()) {
      final jsonString = file.readAsStringSync();

      if (jsonString.isNotEmpty) {
        return Map<String, String>.from(json.decode(jsonString) as Map);
      }
    }

    return {};
  }

  static Future<String> _translate(String text, String languageCode) async {
    // skip english
    if (languageCode == 'en') {
      return text;
    }

    // final uri = Uri.parse('https://api-free.deepl.com/v2/translate');
    final uri = Uri.parse('https://api.deepl.com/v2/translate');

    // replace "Deckr" with "512W345" so it won't get translated
    final copied = text.replaceAll('Deckr', '512W345');

    final body = <String, String>{
      'text': copied,
      // 'auth_key': 'faddb949-42f4-3695-d7c5-6316a360cb15:fx',  // free
      'auth_key': 'd9d95494-f71a-46fb-8aa9-3073706622fc',
      'target_lang': languageCode,
      'source_lang': 'en',
      'format': 'text',
      'formality': 'prefer_less',
    };

    try {
      final res = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        },
        body: body,
      );

      if (res.bodyBytes.isNotEmpty) {
        final result = Map<String, dynamic>.from(
          json.decode(utf8.decode(res.bodyBytes)) as Map,
        );

        final results = result['translations'] as List?;

        if (results != null && results.isNotEmpty) {
          final m = results.first as Map;
          final text = m['text'] as String;

          // replace "512W345" with "Deckr" (see above)
          return text.replaceAll('512W345', 'Deckr');
        } else {
          print(result);
        }
      } else {
        print('body empty');
      }
    } catch (err) {
      print(err);
    }

    print('Failed ($languageCode): $text');

    return text;
  }
}
