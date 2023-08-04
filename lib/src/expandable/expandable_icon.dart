import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:flutter/material.dart';

class ExpandableIcon extends StatefulWidget {
  const ExpandableIcon({
    required ExpandableThemeData theme,
  }) : _theme = theme;

  final ExpandableThemeData _theme;

  @override
  State<ExpandableIcon> createState() => _ExpandableIconState();
}

class _ExpandableIconState extends State<ExpandableIcon> {
  ExpandableThemeData? theme;
  late ExpandableController controller;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();

    controller = ExpandableController.of(context, rebuildOnChange: false)!;
    controller.addListener(_expandedStateChanged);

    _expanded = controller.expanded;
  }

  @override
  void dispose() {
    controller.removeListener(_expandedStateChanged);
    super.dispose();
  }

  void _expandedStateChanged() {
    _expanded = controller.expanded;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    theme ??= ExpandableThemeData.withDefaults(widget._theme);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedRotation(
        turns: _expanded ? 0.25 : 0,
        duration: theme!.animationDuration!,
        child: theme!.expandIcon,
      ),
    );
  }
}
