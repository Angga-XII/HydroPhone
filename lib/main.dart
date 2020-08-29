import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/openApp_screen.dart';

void main() => runApp(Hydrophone());

class Hydrophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpeningScreen(),
    );
  }
}
