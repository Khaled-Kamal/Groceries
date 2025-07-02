import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/homePage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Grabber',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 48,
            fontFamily: 'Daloo',
            color: Color(0xFF0CA201),
          ),
        ),
      ),
    );
  }
}
