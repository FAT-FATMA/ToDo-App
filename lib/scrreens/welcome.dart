import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/login.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(child: Center(child: Logo())),
            SizedBox(height: 20.h),
            Text(
              S.of(context).Task_Management_ToDo_List,
              // style: TextStyle(
              //   fontSize: 24.sp,
              //   fontWeight: FontWeight.bold,
              //   color: titleColor,
              // ),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              S.of(context).productive_tool,
              style: TextStyle(fontSize: 16.sp, color: textColor),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomButton(
                title: S.of(context).lets_Start,
                colorButton: primaryColor,
                colorTitle: textButton,
                size: 50.r,
                borderRadius: 10.h,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
              ),
              // child: ElevatedButton(
              //   onPressed: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (_) => LoginScreen()),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size.fromHeight(50),
              //     backgroundColor: const Color.fromARGB(255, 133, 95, 198),
              //   ),
              //   child: Text(
              //     'lets Start',
              //     style: TextStyle(fontSize: 16.sp, color: Colors.white),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
