import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:flutter/material.dart';

class ExpandableNotifier extends StatefulWidget {
  const ExpandableNotifier({
    required this.controller,
    required this.child,
    Key? key,
  }) : super(key: key);

  final ExpandableController? controller;
  final Widget child;

  @override
  State<ExpandableNotifier> createState() => _ExpandableNotifierState();
}

class _ExpandableNotifierState extends State<ExpandableNotifier> {
  ExpandableThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final cn = ExpandableControllerNotifier(
      controller: widget.controller,
      child: widget.child,
    );

    return theme != null
        ? ExpandableThemeNotifier(themeData: theme, child: cn)
        : cn;
  }
}

class ExpandableControllerNotifier
    extends InheritedNotifier<ExpandableController> {
  const ExpandableControllerNotifier({
    required ExpandableController? controller,
    required Widget child,
  }) : super(notifier: controller, child: child);
}

class ExpandableThemeNotifier extends InheritedWidget {
  const ExpandableThemeNotifier({
    required this.themeData,
    required Widget child,
  }) : super(child: child);
  final ExpandableThemeData? themeData;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return !(oldWidget is ExpandableThemeNotifier &&
        oldWidget.themeData == themeData);
  }
}
