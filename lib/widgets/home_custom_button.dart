import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomButton extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Color colorTitle;
  final double size;
  final double borderRadius;
  final Function() onPressed;
  final bool isSelected;

  const HomeCustomButton({
    super.key,
    required this.title,
    this.colorButton = secondaryColor,
    this.colorTitle = titleColor,
    this.size = 13,
    this.borderRadius = 10,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8),
    
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: isSelected ? primaryColor : colorButton,
        foregroundColor: isSelected ? secondaryColor : colorTitle,
      ),
      onPressed: onPressed,
      child: Text(title, style: TextStyle(fontSize: size.sp)),
    );
  }
}
