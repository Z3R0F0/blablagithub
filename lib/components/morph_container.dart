import 'dart:async';

import 'package:blablagithub/constants/app_colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MorphContainer extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;

  final double? height;
  final double? width;

  const MorphContainer({
    super.key,
    this.onPressed,
    this.color,
    this.child,
    this.height,
    this.width,
  });

  @override
  MorphContainerState createState() => MorphContainerState();
}

class MorphContainerState extends State<MorphContainer> {
  bool _pressed = true;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _initialAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initialAnimation() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _pressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _pressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressed = false;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        setState(() {
          _pressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.height,
        width: widget.width,
        decoration: _neumorphBlank(_pressed, widget.color ?? MyColors.primary),
        child: widget.child,
      ),
    );
  }
}

class DancingContainer extends StatefulWidget {
  final Widget? child;

  final Duration duration;
  final Duration finish;

  const DancingContainer({
    super.key,
    this.child,
    required this.duration,
    required this.finish,
  });

  @override
  DancingContainerState createState() => DancingContainerState();
}

class DancingContainerState extends State<DancingContainer> {
  bool _isPressed = true;
  bool _finished = false;
  late DateTime _startTime;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _startDancingAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startDancingAnimation() {
    _timer = Timer.periodic(widget.duration, (Timer timer) {
      setState(() {
        _isPressed = !_isPressed;
        if (DateTime.now().difference(_startTime) >= widget.finish) {
          _finished = true;
          _isPressed = true;
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration:
          _neumorphBlank((_finished) ? true : _isPressed, MyColors.primary),
      child: widget.child,
    );
  }
}

BoxDecoration _neumorphBlank(bool pressed, Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: color,
    boxShadow: [
      BoxShadow(
        blurRadius: pressed ? 5.0 : 8.0,
        color: pressed ? MyColors.primary : MyColors.backgroundPrimaryLight,
        offset: -(pressed ? const Offset(10, 10) : const Offset(0, 0)),
      ),
      BoxShadow(
        blurRadius: pressed ? 5.0 : 20.0,
        color: pressed ? MyColors.primary : MyColors.backgroundPrimary,
        offset: -(pressed ? const Offset(10, 10) : const Offset(17, 17)),
      ),
    ],
  );
}
