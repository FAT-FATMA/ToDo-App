import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/login.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/image.dart';
import 'package:flutter_application_1/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit(),
      child: BlocBuilder<LogincubitDartCubit, StatesLogin>(
        builder: (context, state) {
          var cubit = LogincubitDartCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Logo()),
                    SizedBox(height: 30.h),

                    Text(
                      S.of(context).Sign_Up_here,
                      // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                      //     color: titleColor),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Textfield(
                      controller: displayNameController,
                      textFieldHint: S.of(context).displayName,
                      isObsecures: false,
                    ),
                    SizedBox(height: 10.h),
                    Textfield(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      textFieldHint: S.of(context).phone,
                      isObsecures: false,
                      showCountryCode: true,
                    ),
                    SizedBox(height: 10.h),
                    Textfield(
                      controller: yearsOfExperienceController,
                      textFieldHint: S.of(context).Years_experience,
                      isObsecures: false,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 10.h),

                    // Textfield(
                    //   controller: levelController,
                    //   textFieldHint: S.of(context).level,
                    //   isObsecures: false,
                    // ),
                    // DropdownButtonFormField<String>(
                    //   decoration: InputDecoration(
                    //     labelText: S.of(context).level,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.r),
                    //     ),
                    //   ),
                    //   value: levelController.text,
                    //   items: [
                    //           S.of(context).fresh,
                    //           S.of(context).senior,
                    //           S.of(context).junior,
                    //           S.of( context).midLevel

                    //   ], onChanged: (String? value) {
                    //     setState(() {
                    //       levelController.text = value!;
                    //     });
                    //   }),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: S.of(context).level,
                        //hintStyle: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      value: selectedLevel,
                      items:
                          [
                            S.of(context).fresh,
                            S.of(context).senior,
                            S.of(context).junior,
                            S.of(context).midLevel,
                          ].map((level) {
                            return DropdownMenuItem(
                              value: level,
                              child: Text(level),
                            );
                          }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedLevel = value; // ✅ update value
                        });
                      },
                    ),

                    SizedBox(height: 10.h),
                    Textfield(
                      controller: passwordController,
                      textFieldHint: S.of(context).password,
                      isObsecures: true,
                      showPasswordToggle: true,
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
                      title: S.of(context).Sign_Up,
                      onPressed: () {
                        log("object ${phoneController.text}");
                        cubit.register(
                          phoneController,
                          passwordController,
                          displayNameController,
                          yearsOfExperienceController,
                          selectedLevel!,
                          context,
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: Text.rich(
                        textAlign: TextAlign.center,

                        TextSpan(
                          text: S.of(context).allready_have_account,
                          style: TextStyle(fontSize: 14.sp, color: textColor),

                          children: [
                            TextSpan(
                              text: S.of(context).Login,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
