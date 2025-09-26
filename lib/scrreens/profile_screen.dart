import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/widgets/build_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit()..profile(),
      child: BlocBuilder<LogincubitDartCubit, StatesLogin>(
        builder: (context, state) {
          var cubit = LogincubitDartCubit.get(context);
          return Scaffold(
            // backgroundColor: Colors.white,
            appBar: AppBar(
              //backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                S.of(context).Profile,
                // style: TextStyle(
                //   // color: Colors.black,

                //   fontSize: 18,
                //   fontWeight: FontWeight.w500,
                // ),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  //color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: cubit.profModeel == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildInfoCard(
                          context,
                          S.of(context).NAME,
                          " ${cubit.profModeel?.name ?? ''}",
                        ),
                         SizedBox(height: 12.h),
                        buildInfoCard(
                          context,
                          S.of(context).PHONE,
                          cubit.profModeel?.username ?? '',
                        ),
                         SizedBox(height: 12.h),
                        buildInfoCard(
                          context,
                          S.of(context).level,
                          " ${cubit.profModeel?.level ?? ''}",
                        ),
                         SizedBox(height: 12.h),
                        buildInfoCard(
                          context,
                          S.of(context).YEARS_OF_EXPERIENCE,
                          "  ${cubit.profModeel?.experience ?? ''}",
                        ),
                         SizedBox(height: 12.h),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
