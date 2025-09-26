import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cash_helper.dart';
import 'package:flutter_application_1/scrreens/home.dart';
import 'package:flutter_application_1/scrreens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required void Function(Locale locale) setLocale, required Null Function() onFinished});

  @override
  State<SplashScreen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<SplashScreen> {
  late Timer _timer;
  initTimer() {
    _timer = Timer(Duration(seconds: 3), () {
      print("object${CashHelper.getData(key: "token")}");
      if (CashHelper.getData(key: "token") != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen(setLocale: (Locale locale) {  },)),
        );
      } else {
        Navigator.push
        (
          context,
          MaterialPageRoute(builder: (_) => WelcomeScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/untitled_image.png', fit: BoxFit.cover),
    );
  }
}
