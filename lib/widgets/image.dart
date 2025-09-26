import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/todocheck.png',
      height: MediaQuery.of(context).size.height * 0.3,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}
