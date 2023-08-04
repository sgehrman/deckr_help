import 'package:deckr_help/src/help_dialog/help_item.dart';
import 'package:dfc_flutter/dfc_flutter_web_lite.dart';
import 'package:flutter/material.dart';

class HelpList extends StatelessWidget {
  const HelpList({
    required this.children,
  });

  final List<HelpItem> children;

  @override
  Widget build(BuildContext context) {
    if (Utils.isNotEmpty(children)) {
      return ShrinkWrappedList(
        separatorBuilder: null,
        itemBuilder: (context, index) {
          return children[index];
        },
        itemCount: children.length,
      );
    } else {
      return const Center(
        child: Text('Nothing Found'),
      );
    }
  }
}
