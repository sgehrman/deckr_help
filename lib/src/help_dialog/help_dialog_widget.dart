import 'package:deckr_help/deckr_help.dart';
import 'package:deckr_help/src/help_dialog/help_item.dart';
import 'package:deckr_help/src/help_dialog/help_list.dart';
import 'package:dfc_flutter/dfc_flutter_web_lite.dart';
import 'package:flutter/material.dart';

class HelpDialogWidget extends StatelessWidget {
  const HelpDialogWidget({
    required this.data,
    required this.isMobile,
    this.title,
  });

  final List<HelpData> data;
  final bool isMobile;
  final ParagrafSpec? title;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final helpChildren = data.map(
      (x) {
        return HelpItem(
          isMobile: isMobile,
          header: Paragraf(
            isMobile: isMobile,
            specs: [x.title],
          ),
          expanded: Paragraf(
            isMobile: isMobile,
            specs: [x.message],
          ),
          key: ValueKey(index++),
          initialExpanded: index == 1,
        );
      },
    ).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Paragraf(
              specs: [
                title!,
              ],
              isMobile: isMobile,
            ),
            const SizedBox(height: 20),
          ],
          HelpList(
            children: helpChildren,
          ),
        ],
      ),
    );
  }
}
