import 'package:flutter/material.dart';

/// Parallax Swiper

class ParallaxWidget extends StatefulWidget {
  ParallaxWidget({
    @required this.layer1,
    this.layer2,
    this.layer3,
    this.layer4,
    this.layer5,
    this.alignment = Alignment.center,
    this.returnDuration = const Duration(milliseconds: 500),
    this.returnCurve = Curves.easeOut,
  });

  final Widget layer1;
  final Widget layer2;
  final Widget layer3;
  final Widget layer4;
  final Widget layer5;

  /// The alignment on the widget stack
  /// Default value [Alignment.center]
  final Alignment alignment;

  /// The duration of the return animation
  /// Default value [Duration(milliseconds: 500)]
  final Duration returnDuration;

  /// The curve of the return animation
  /// Default value [Curves.easeOut]
  final Curve returnCurve;

  _ParallaxWidgetState createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget>
    with SingleTickerProviderStateMixin {
  Animation<Offset> _returnAnimation;
  AnimationController _returnController;

  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _returnController =
        AnimationController(duration: widget.returnDuration, vsync: this);
    _returnController.addListener(() {
      setState(() {
        _offset = _returnAnimation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _layer1 = Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(0.001 * _offset.dy)
        ..rotateY(-0.001 * _offset.dx)
        ..translate(0.4 * _offset.dx, 0.4 * _offset.dy),
      alignment: FractionalOffset.center,
      child: widget.layer1,
    );

    var _layer2 = Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.003)
        ..rotateX(0.001 * _offset.dy)
        ..rotateY(-0.001 * _offset.dx)
        ..translate(0.35 * _offset.dx, 0.35 * _offset.dy),
      alignment: FractionalOffset.center,
      child: widget.layer2,
    );

    var _layer3 = Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.004)
        ..rotateX(0.001 * _offset.dy)
        ..rotateY(-0.001 * _offset.dx)
        ..translate(0.3 * _offset.dx, 0.3 * _offset.dy),
      alignment: FractionalOffset.center,
      child: widget.layer3,
    );

    var _layer4 = Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.005)
        ..rotateX(0.001 * _offset.dy)
        ..rotateY(-0.001 * _offset.dx)
        ..translate(0.25 * _offset.dx, 0.25 * _offset.dy),
      alignment: FractionalOffset.center,
      child: widget.layer4,
    );

    var _layer5 = Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.006)
        ..rotateX(0.001 * _offset.dy)
        ..rotateY(-0.001 * _offset.dx)
        ..translate(0.2 * _offset.dx, 0.2 * _offset.dy),
      alignment: FractionalOffset.center,
      child: widget.layer5,
    );

    return GestureDetector(
      child: Stack(
        alignment: widget.alignment,
        children: <Widget>[
          _layer5,
          _layer4,
          _layer3,
          _layer2,
          _layer1,
        ],
      ),

      // Touch input controls
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta;
        });
      },
      onPanEnd: (details) {
        _runReturnAnimation();
      },
    );
  }

  @override
  void dispose() {
    _returnController.dispose();
    super.dispose();
  }

  /// Animate the widget to return to the center position
  void _runReturnAnimation() {
    final Animatable<Offset> _tween =
        Tween<Offset>(begin: _offset, end: Offset.zero)
            .chain(CurveTween(curve: widget.returnCurve));
    _returnAnimation = _returnController.drive(_tween);
    _returnController.reset();
    _returnController.forward();
  }
}
