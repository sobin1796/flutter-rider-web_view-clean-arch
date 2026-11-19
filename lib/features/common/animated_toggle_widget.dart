import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedToggleWidget extends StatefulWidget {
  const AnimatedToggleWidget({
    required this.firstChild, required this.secondChild, super.key,
    this.duration = const Duration(milliseconds: 900),
    this.interval = const Duration(seconds: 2),
    this.transitionBuilder,
  });

  final Widget firstChild;
  final Widget secondChild;
  final Duration duration;
  final Duration interval;
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  @override
  State<AnimatedToggleWidget> createState() => _AnimatedToggleWidgetState();
}

class _AnimatedToggleWidgetState extends State<AnimatedToggleWidget> {
  bool _showFirst = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(widget.interval, (_) {
      if (!mounted) return;

      setState(() {
        _showFirst = !_showFirst;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      transitionBuilder:
          widget.transitionBuilder ??
          (child, animation) => FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          ),
      child: _showFirst ? widget.firstChild : widget.secondChild,
    );
  }
}
