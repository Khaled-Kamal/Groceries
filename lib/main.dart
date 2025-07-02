import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/SplashPage.dart';

void main() {
  runApp(const GrocreyAPP());
}

class GrocreyAPP extends StatelessWidget {
  const GrocreyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashpage());
  }
}
