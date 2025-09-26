import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/sign_up.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // Removed invalid constructor code.
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit(),
      child: BlocBuilder<LogincubitDartCubit, StatesLogin>(
        builder: (context, state) {
          var cubit = LogincubitDartCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Logo()),

                      SizedBox(height: 10.h),
                      Text(
                        S.of(context).Login,
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
                      SizedBox(height: 10.h),

                      Textfield(
                        controller: phoneController,
                        textFieldHint: S.of(context).phone,
                        isObsecures: false,
                        showCountryCode: true,
                        textInputType: TextInputType.phone,
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
                        title: S.of(context).SignIn,

                        onPressed: () {
                          // Handle login logic
                          //.requestPost(url: '/auth/login', data: {});
                          cubit.login(
                            phoneController,
                            passwordController,
                            context,
                          );
                        },
                      ),

                      SizedBox(height: 20.h),
                      Center(
                        child: Text.rich(
                          textAlign: TextAlign.center,

                          TextSpan(
                            text: S.of(context).any_account,
                            style: TextStyle(fontSize: 14.sp, color: textColor),

                            children: [
                              TextSpan(
                                text: S.of(context).Sign_Up_Now,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => signupScreen(),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
