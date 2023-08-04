import 'package:deckr_help/src/expandable/expandable_button.dart';
import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_icon.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:deckr_help/src/expandable/expandable_theme_notifier.dart';
import 'package:flutter/material.dart';

typedef ExpandableBuilder = Widget Function(
  BuildContext context,
  Widget expanded,
);

class ExpandablePanel extends StatelessWidget {
  const ExpandablePanel({
    required this.header,
    required this.expanded,
    required this.builder,
    required this.isMobile,
    required ExpandableThemeData theme,
    this.controller,
    this.onExpand,
  }) : _theme = theme;

  final Widget header;
  final Widget expanded;
  final ExpandableBuilder builder;
  final void Function()? onExpand;
  final ExpandableController? controller;
  final ExpandableThemeData _theme;
  final bool isMobile;

  Widget _buildWithHeader(
    BuildContext context,
    ExpandableThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: theme.headerDecoration,
          clipBehavior: Clip.antiAlias,
          child: ExpandableButton(
            theme: _theme,
            child: Row(
              children: [
                ExpandableIcon(theme: theme),
                SizedBox(width: isMobile ? 5 : 8),
                Expanded(
                  child: header,
                ),
              ],
            ),
          ),
        ),
        builder(
          context,
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (onExpand != null) {
                onExpand?.call();
              }

              final controller = ExpandableController.of(context);
              controller?.toggle();
            },
            child: expanded,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ExpandableThemeData.withDefaults(_theme);

    final panel = _buildWithHeader(context, theme);

    if (controller != null) {
      return ExpandableNotifier(
        controller: controller,
        child: panel,
      );
    } else {
      final controller =
          ExpandableController.of(context, rebuildOnChange: false);
      if (controller == null) {
        return ExpandableNotifier(
          controller: controller,
          child: panel,
        );
      } else {
        return panel;
      }
    }
  }
}
