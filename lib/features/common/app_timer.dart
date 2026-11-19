import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class AppTimer extends StatefulWidget {
  const AppTimer({
    required this.initialSeconds,
    required this.isActive,
    this.builder,
    this.showIcon = true,
    super.key,
  });

  final int initialSeconds;
  final bool isActive;
  final Widget Function(String label, int remainingSeconds)? builder;
  final bool showIcon;

  @override
  State<AppTimer> createState() => _AppTimerState();
}

class _AppTimerState extends State<AppTimer> {
  Timer? _timer;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds.clamp(0, 0x7fffffff);
    _startTimerIfNeeded();
  }

  @override
  void didUpdateWidget(covariant AppTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSeconds != widget.initialSeconds ||
        oldWidget.isActive != widget.isActive) {
      _remainingSeconds = widget.initialSeconds.clamp(0, 0x7fffffff);
      _timer?.cancel();
      _startTimerIfNeeded();
      setState(() {});
    }
  }

  void _startTimerIfNeeded() {
    if (!widget.isActive || _remainingSeconds <= 0) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_remainingSeconds <= 1) {
        _timer?.cancel();
        setState(() => _remainingSeconds = 0);
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  String get _label {
    final duration = Duration(seconds: _remainingSeconds);
    final days = duration.inDays.toString().padLeft(2, '0');
    final hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${days}d:${hours}h:${minutes}m:${seconds}s';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final builder = widget.builder;
    if (builder != null) return builder(_label, _remainingSeconds);

    final isEnded = _remainingSeconds == 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: isEnded ? const Color(0x26FFFFFF) : const Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0x33FFFFFF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showIcon) ...[
            Icon(
              isEnded ? Icons.check_circle_outline : Icons.timer_outlined,
              size: 16,
              color: isEnded
                  ? const Color(0xFFB8E986)
                  : const Color(0xFFFFD95A),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            isEnded ? 'ENDED' : _label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.35,
            ),
          ),
        ],
      ),
    );
  }
}

class AppTimeCountDown extends StatelessWidget {
  const AppTimeCountDown({
    required this.isRunning,
    required this.status,
    required this.timeDuration,
    super.key,
  });
  final int timeDuration;
  final String status;
  final bool isRunning;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.appRed,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.alarm_rounded, size: 12, color: AppColors.appYellow)
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(0.85, 0.85),
                end: const Offset(1.15, 1.15),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              ),
          const HorizontalSpacing(3),
          AppTimer(
            initialSeconds: timeDuration ?? 0,
            isActive: status.toLowerCase() == 'running' || isRunning == true,
            builder: (label, remainingSeconds) => Text(
              remainingSeconds > 0 ? label : 'ENDED',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.15,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
