import 'dart:math' as math;

import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_panel.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:deckr_help/src/expandable/expandable_theme_notifier.dart';
import 'package:deckr_help/src/expandable/scroll_on_expand.dart';
import 'package:deckr_help/src/styles.dart';
import 'package:dfc_flutter/dfc_flutter_web_lite.dart';
import 'package:flutter/material.dart';

class HelpItem extends StatefulWidget {
  const HelpItem({
    required Key key,
    required this.header,
    required this.expanded,
    required this.isMobile,
    this.initialExpanded = false,
  }) : super(key: key);

  final Widget header;
  final Widget expanded;
  final bool initialExpanded;
  final bool isMobile;

  @override
  State<HelpItem> createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {
  ExpandableController? _controller;
  ExpandableThemeData? _expandableTheme;

  @override
  void initState() {
    super.initState();

    _controller = ExpandableController(initialExpanded: widget.initialExpanded);
  }

  Widget _expandIcon({required bool downArrow}) {
    return SizedBox(
      height: widget.isMobile ? 16 : 20,
      width: widget.isMobile ? 16 : 20,
      child: Center(
        child: SizedBox(
          height: widget.isMobile ? 14 : 18,
          width: widget.isMobile ? 12 : 14,
          child: CustomPaint(
            painter: TrianglePainter(
              color: Styles.primary(context),
            ),
          ),
        ),
      ),
    );
  }

  ExpandableThemeData _theme(BuildContext context) {
    _expandableTheme ??= ExpandableThemeData(
      collapseIcon: _expandIcon(downArrow: true),
      expandIcon: _expandIcon(downArrow: false),
      iconRotationAngle: math.pi / 2,
      animationDuration: const Duration(milliseconds: 300),
      crossFadePoint: 0,
      hoverColor: Utils.isDarkMode(context)
          ? Colors.white.withOpacity(0.05)
          : Colors.black.withOpacity(0.05),
      headerDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    return _expandableTheme!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = _theme(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ExpandableNotifier(
        controller: _controller,
        child: ScrollOnExpand(
          theme: theme,
          child: ExpandablePanel(
            isMobile: widget.isMobile,
            theme: theme,
            header: widget.header,
            expanded: widget.expanded,
            builder: (_, expanded) {
              return Expandable(
                expanded: Padding(
                  padding: EdgeInsets.only(
                    top: widget.isMobile ? 8 : 10,
                    left: widget.isMobile ? 40 : 48,
                    bottom: widget.isMobile ? 14 : 16,
                  ),
                  child: expanded,
                ),
                theme: theme,
              );
            },
          ),
        ),
      ),
    );
  }
}
