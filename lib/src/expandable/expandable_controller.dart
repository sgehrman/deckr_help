import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:deckr_help/src/expandable/expandable_theme_notifier.dart';
import 'package:flutter/material.dart';

class ExpandableController extends ValueNotifier<bool> {
  ExpandableController({
    bool? initialExpanded,
  }) : super(initialExpanded ?? false);

  bool get expanded => value;

  set expanded(bool exp) {
    value = exp;
  }

  void toggle() {
    expanded = !expanded;
  }

  static ExpandableController? of(
    BuildContext context, {
    bool rebuildOnChange = true,
  }) {
    final notifier = rebuildOnChange
        ? context
            .dependOnInheritedWidgetOfExactType<ExpandableControllerNotifier>()
        : context.findAncestorWidgetOfExactType<ExpandableControllerNotifier>();

    return notifier?.notifier;
  }
}

class Expandable extends StatelessWidget {
  const Expandable({
    required ExpandableThemeData theme,
    Key? key,
    this.collapsed,
    this.expanded,
    this.controller,
  })  : _theme = theme,
        super(key: key);
  final Widget? collapsed;
  final Widget? expanded;
  final ExpandableController? controller;

  final ExpandableThemeData _theme;

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? ExpandableController.of(context)!;
    final theme = ExpandableThemeData.withDefaults(_theme);

    return AnimatedCrossFade(
      alignment: theme.alignment!,
      firstChild: collapsed ?? Container(),
      secondChild: expanded ?? Container(),
      firstCurve: Interval(
        theme.collapsedFadeStart,
        theme.collapsedFadeEnd,
        curve: theme.fadeCurve!,
      ),
      secondCurve: Interval(
        theme.expandedFadeStart,
        theme.expandedFadeEnd,
        curve: theme.fadeCurve!,
      ),
      sizeCurve: theme.sizeCurve!,
      crossFadeState: controller.expanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: theme.animationDuration!,
    );
  }
}
