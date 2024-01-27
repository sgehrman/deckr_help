import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('ru'),
    Locale('sv'),
    Locale('zh')
  ];

  /// No description provided for @basicUsageHowDoISaveABookmark.
  ///
  /// In en, this message translates to:
  /// **'Basic usage: how do I save a bookmark?'**
  String get basicUsageHowDoISaveABookmark;

  /// No description provided for @doYouHaveACoupon.
  ///
  /// In en, this message translates to:
  /// **'Do you have a coupon?'**
  String get doYouHaveACoupon;

  /// No description provided for @howDoIInstallDeckrOnMultipleComputers.
  ///
  /// In en, this message translates to:
  /// **'How do I install Deckr on multiple computers?'**
  String get howDoIInstallDeckrOnMultipleComputers;

  /// No description provided for @howDoIInstallTheBrowserExtension.
  ///
  /// In en, this message translates to:
  /// **'How do I install the browser extension?'**
  String get howDoIInstallTheBrowserExtension;

  /// No description provided for @howDoIInstallTheDesktopApp.
  ///
  /// In en, this message translates to:
  /// **'How do I install the desktop app?'**
  String get howDoIInstallTheDesktopApp;

  /// No description provided for @howDoSetDeckrToAutoLaunchOnStartup.
  ///
  /// In en, this message translates to:
  /// **'How do set Deckr to auto launch on startup?'**
  String get howDoSetDeckrToAutoLaunchOnStartup;

  /// No description provided for @whatAreActivations.
  ///
  /// In en, this message translates to:
  /// **'What are \"activations\"?'**
  String get whatAreActivations;

  /// No description provided for @whatHappensWhenMyLicenseExpires.
  ///
  /// In en, this message translates to:
  /// **'What happens when my license expires?'**
  String get whatHappensWhenMyLicenseExpires;

  /// No description provided for @whatIsALicenseKey.
  ///
  /// In en, this message translates to:
  /// **'What is a license key?'**
  String get whatIsALicenseKey;

  /// No description provided for @whatIsThatBlueIconInMyMenubar.
  ///
  /// In en, this message translates to:
  /// **'What is that blue icon in my menubar?'**
  String get whatIsThatBlueIconInMyMenubar;

  /// No description provided for @whatIsYourPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'What is your privacy policy?'**
  String get whatIsYourPrivacyPolicy;

  /// No description provided for @whatSYourRefundPolicy.
  ///
  /// In en, this message translates to:
  /// **'What\'s your refund policy?'**
  String get whatSYourRefundPolicy;

  /// No description provided for @whyDoIHaveToSignInToAccessTheDeckStore.
  ///
  /// In en, this message translates to:
  /// **'Why do I have to sign-in to access the Deck store?'**
  String get whyDoIHaveToSignInToAccessTheDeckStore;

  /// No description provided for @whyIsThereAnBrowserExtensionAndADesktopApplication.
  ///
  /// In en, this message translates to:
  /// **'Why is there an browser extension and a desktop application?'**
  String get whyIsThereAnBrowserExtensionAndADesktopApplication;

  /// No description provided for @whyProblemDoesDeckrSolve.
  ///
  /// In en, this message translates to:
  /// **'Why problem does Deckr solve?'**
  String get whyProblemDoesDeckrSolve;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['cs', 'da', 'de', 'en', 'es', 'fi', 'fr', 'it', 'ja', 'nl', 'ru', 'sv', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs': return AppLocalizationsCs();
    case 'da': return AppLocalizationsDa();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'nl': return AppLocalizationsNl();
    case 'ru': return AppLocalizationsRu();
    case 'sv': return AppLocalizationsSv();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
