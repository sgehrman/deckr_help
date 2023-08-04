import 'package:deckr_help/src/expandable/expandable_controller.dart';
import 'package:deckr_help/src/expandable/expandable_theme.dart';
import 'package:flutter/material.dart';

class ScrollOnExpand extends StatefulWidget {
  const ScrollOnExpand({
    required this.child,
    required this.theme,
    Key? key,
    this.scrollOnExpand = true,
    this.scrollOnCollapse = true,
  }) : super(key: key);

  final Widget child;
  final bool scrollOnExpand;
  final bool scrollOnCollapse;

  final ExpandableThemeData theme;

  @override
  State<ScrollOnExpand> createState() => _ScrollOnExpandState();
}

class _ScrollOnExpandState extends State<ScrollOnExpand> {
  ExpandableController? _controller;
  int _isAnimating = 0;
  BuildContext? _lastContext;
  late ExpandableThemeData _theme;

  @override
  void initState() {
    super.initState();

    _theme = ExpandableThemeData.withDefaults(widget.theme);

    _controller = ExpandableController.of(context, rebuildOnChange: false);
    _controller!.addListener(_expandedStateChanged);
  }

  @override
  void didUpdateWidget(ScrollOnExpand oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newController =
        ExpandableController.of(context, rebuildOnChange: false);
    if (newController != _controller) {
      _controller!.removeListener(_expandedStateChanged);
      _controller = newController;
      _controller!.addListener(_expandedStateChanged);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_expandedStateChanged);
  }

  void _animationComplete() {
    _isAnimating--;
    if (_isAnimating == 0 && _lastContext != null && mounted) {
      if ((_controller!.expanded && widget.scrollOnExpand) ||
          (!_controller!.expanded && widget.scrollOnCollapse)) {
        _lastContext
            ?.findRenderObject()
            ?.showOnScreen(duration: _theme.scrollAnimationDuration!);
      }
    }
  }

  void _expandedStateChanged() {
    _isAnimating++;
    Future.delayed(
      _theme.scrollAnimationDuration! + const Duration(milliseconds: 10),
      _animationComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    _lastContext = context;

    return widget.child;
  }
}
