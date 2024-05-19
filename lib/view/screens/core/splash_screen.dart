import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lara',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(
                    0xFF3DBC24)),
              ),
              Text(
                'Classifier',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}