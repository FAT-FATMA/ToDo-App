import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color colorTitle;
  final Color colorButton;
  final Function() onPressed;
  final double size;
  final double borderRadius;
  const CustomButton({
    super.key,
    /*>>>*/ required this.title,
    this.colorTitle = textButton,
    this.colorButton = primaryColor,
    /*>>>*/ required this.onPressed,
    this.size = 50,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: colorButton,
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 16.sp, color: colorTitle),
      ),
    );
  }
}
