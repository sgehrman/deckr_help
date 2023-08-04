import 'dart:math' as math;

import 'package:deckr_help/src/expandable/expandable_theme_notifier.dart';
import 'package:flutter/material.dart';

class ExpandableThemeData {
  const ExpandableThemeData({
    required this.expandIcon,
    required this.collapseIcon,
    this.animationDuration,
    this.scrollAnimationDuration,
    this.crossFadePoint,
    this.fadeCurve,
    this.sizeCurve,
    this.alignment,
    this.hoverColor,
    this.iconRotationAngle,
    this.headerDecoration,
  });

  factory ExpandableThemeData.combine(
    ExpandableThemeData theme,
    ExpandableThemeData defaults,
  ) {
    if (theme.isFull()) {
      return theme;
    } else {
      return ExpandableThemeData(
        animationDuration:
            theme.animationDuration ?? defaults.animationDuration,
        scrollAnimationDuration:
            theme.scrollAnimationDuration ?? defaults.scrollAnimationDuration,
        crossFadePoint: theme.crossFadePoint ?? defaults.crossFadePoint,
        fadeCurve: theme.fadeCurve ?? defaults.fadeCurve,
        sizeCurve: theme.sizeCurve ?? defaults.sizeCurve,
        alignment: theme.alignment ?? defaults.alignment,
        hoverColor: theme.hoverColor ?? defaults.hoverColor,
        iconRotationAngle:
            theme.iconRotationAngle ?? defaults.iconRotationAngle,
        expandIcon: theme.expandIcon,
        collapseIcon: theme.collapseIcon,
        headerDecoration: theme.headerDecoration ?? defaults.headerDecoration,
      );
    }
  }

  factory ExpandableThemeData.withDefaults(
    ExpandableThemeData theme,
  ) {
    if (theme.isFull()) {
      return theme;
    } else {
      return ExpandableThemeData.combine(
        theme,
        defaults,
      );
    }
  }
  static const ExpandableThemeData defaults = ExpandableThemeData(
    animationDuration: Duration(milliseconds: 300),
    scrollAnimationDuration: Duration(milliseconds: 300),
    crossFadePoint: 0.5,
    fadeCurve: Curves.linear,
    sizeCurve: Curves.fastOutSlowIn,
    alignment: Alignment.topLeft,
    hoverColor: Colors.transparent,
    iconRotationAngle: -math.pi,
    expandIcon: Icon(Icons.expand_more),
    collapseIcon: Icon(Icons.expand_more),
    headerDecoration: BoxDecoration(color: Colors.transparent),
  );

  final Duration? animationDuration;
  final Duration? scrollAnimationDuration;
  final double? crossFadePoint;
  final AlignmentGeometry? alignment;
  final Curve? fadeCurve;
  final Curve? sizeCurve;
  final Color? hoverColor;
  final BoxDecoration? headerDecoration;
  final double? iconRotationAngle;
  final Widget expandIcon;
  final Widget collapseIcon;

  double get collapsedFadeStart =>
      crossFadePoint! < 0.5 ? 0 : (crossFadePoint! * 2 - 1);

  double get collapsedFadeEnd =>
      crossFadePoint! < 0.5 ? 2 * crossFadePoint! : 1;

  double get expandedFadeStart =>
      crossFadePoint! < 0.5 ? 0 : (crossFadePoint! * 2 - 1);

  double get expandedFadeEnd => crossFadePoint! < 0.5 ? 2 * crossFadePoint! : 1;

  bool isFull() {
    return animationDuration != null &&
        scrollAnimationDuration != null &&
        crossFadePoint != null &&
        fadeCurve != null &&
        sizeCurve != null &&
        alignment != null &&
        iconRotationAngle != null &&
        hoverColor != null &&
        headerDecoration != null;
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return true;
    } else if (other is ExpandableThemeData) {
      return animationDuration == other.animationDuration &&
          scrollAnimationDuration == other.scrollAnimationDuration &&
          crossFadePoint == other.crossFadePoint &&
          fadeCurve == other.fadeCurve &&
          sizeCurve == other.sizeCurve &&
          alignment == other.alignment &&
          hoverColor == other.hoverColor &&
          iconRotationAngle == other.iconRotationAngle &&
          expandIcon == other.expandIcon &&
          headerDecoration == other.headerDecoration &&
          collapseIcon == other.collapseIcon;
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    return 0;
  }

  static ExpandableThemeData of(
    BuildContext context, {
    bool rebuildOnChange = true,
  }) {
    final notifier = rebuildOnChange
        ? context.dependOnInheritedWidgetOfExactType<ExpandableThemeNotifier>()
        : context.findAncestorWidgetOfExactType<ExpandableThemeNotifier>();

    return notifier?.themeData ?? defaults;
  }
}

class ExpandableTheme extends StatelessWidget {
  const ExpandableTheme({required this.data, required this.child});
  final ExpandableThemeData data;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ExpandableThemeNotifier? n =
        context.dependOnInheritedWidgetOfExactType<ExpandableThemeNotifier>();

    return ExpandableThemeNotifier(
      themeData: ExpandableThemeData.combine(data, n!.themeData!),
      child: child,
    );
  }
}
