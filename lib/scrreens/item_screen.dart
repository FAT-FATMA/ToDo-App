import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/new_task.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/todo_model.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/scrreens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemScreen extends StatelessWidget {
  final TodoModel todoModel;
  const ItemScreen({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit(),
      child: BlocConsumer<LogincubitDartCubit, StatesLogin>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = LogincubitDartCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).Task_Details),

              actions: [
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert),

                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: S.of(context).Edit,
                      child: Text(S.of(context).Edit),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                NewTask(todoModel: todoModel, isEdit: true),
                          ),
                        );
                      },
                    ),
                   
                    PopupMenuItem(
                      value: S.of(context).Delete,
                      child: Text(
                        S.of(context).Delete,
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(S.of(context).Confirm_Delete),
                              content: Text(S.of(context).confirm_massage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close popup only
                                  },
                                  child: Text(S.of(context).Cancel),
                                ),
                                TextButton(
                                  onPressed: () {
                                    cubit.deleteTask(todoModel.id ?? "");
                                    Navigator.pop(context); // Close dialog
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeScreen(
                                          setLocale: (Locale locale) {},
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    S.of(context).Delete,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag:
                            'taskImage_${todoModel.id}', // Unique tag for each item

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CachedNetworkImage(
                            imageUrl: todoModel.image ?? "",
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 50,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        todoModel.title ?? "",
                        // style: const TextStyle(
                        //   fontSize: 27,
                        //   fontWeight: FontWeight.bold,
                        //   //  color: textColor,
                        // ),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Text(
                        todoModel.description ?? "",
                        // style: const TextStyle(fontSize: 19, color: textColor),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 19.sp),
                      ),

                      SizedBox(height: 15.h),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        // width: 150,
                        // height: 45,
                        decoration: BoxDecoration(
                          // color: Theme.of(
                          //   context,
                          // ).colorScheme.secondary, // background color
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ), // rounded corners
                        ),

                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: S.of(context).Priority,
                                style:  TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${todoModel.priority ?? ''}",
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      color:
                                          todoModel.status == S.of(context).low
                                          ? Colors.teal
                                          : todoModel.status ==
                                                S.of(context).medium
                                          ? Colors.blue
                                          : todoModel.status ==
                                                S.of(context).high
                                          ? Colors.orange
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      //Text("Date: ${todoModel.date ?? ''}"),
                      SizedBox(height: 20.h),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //  color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ), // rounded corners
                        ),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: S.of(context).Status,
                                style:  TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${todoModel.status ?? ''}",
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      color:
                                          todoModel.status ==
                                              S.of(context).waiting
                                          ? Colors.teal
                                          : todoModel.status ==
                                                S.of(context).finished
                                          ? Colors.blue
                                          : todoModel.status ==
                                                S.of(context).inprogress
                                          ? Colors.orange
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        // margin: const EdgeInsets.(.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ), // rounded corners
                        ),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: S.of(context).Due_date,
                                style:  TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${todoModel.date ?? ''}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
