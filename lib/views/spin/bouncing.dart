import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  final Widget child;
  final VoidCallback onPress;
  final Function(PointerMoveEvent event) onMove;

  const Bouncing({
    super.key,
    required this.child,
    required this.onPress,
    required this.onMove,
  });

  @override
  _BouncingState createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  double _scale = 1.2;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: -0.1,
      upperBound: 0.2,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerMove: (PointerMoveEvent event) {
        widget.onMove(event);
      },
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        widget.onPress();
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
