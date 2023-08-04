import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:flutter/material.dart';

class ExpandableButton extends StatelessWidget {
  const ExpandableButton({
    required this.child,
    this.theme,
  });

  final Widget? child;
  final ExpandableThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);

    return InkWell(
      onTap: controller!.toggle,
      hoverColor: theme?.hoverColor,
      child: child,
    );
  }
}
