import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parallax_widget/circle_widget.dart';
import 'package:parallax_widget/parallax_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var layer1 = Circle(
      image: Image.asset('assets/1.png', fit: BoxFit.fill),
      size: 300,
    );

    var layer2 = Circle(
      image: Image.asset(
        'assets/2.png',
        fit: BoxFit.fill,
      ),
      size: 250,
    );

    var layer3 = Circle(
      size: 200,
      image: Image.asset(
        'assets/3.png',
        fit: BoxFit.fill,
      ),
    );

    var layer4 = Circle(
      size: 150,
      image: Image.asset(
        'assets/4.png',
        fit: BoxFit.fill,
      ),
    );

    var layer5 = Circle(
      size: 100,
      image: Image.asset(
        'assets/5.png',
        fit: BoxFit.fill,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: ParallaxWidget(
          layer1: layer1,
          layer2: layer2,
          layer3: layer3,
          layer4: layer4,
          layer5: layer5,
          returnCurve: Curves.bounceOut,
        ),
      ),
    );
  }
}
