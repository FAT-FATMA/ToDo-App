// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
// import 'package:flutter_application_1/generated/l10n.dart';
// import 'package:flutter_application_1/scrreens/home.dart';
// import 'package:flutter_application_1/theme/theme_constans.dart';
// import 'package:flutter_application_1/todo_model.dart';
// import 'package:flutter_application_1/widgets/custom_button.dart';
// import 'package:flutter_application_1/widgets/text_field.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NewTask extends StatefulWidget {
//   final TodoModel? todoModel;
//   final bool isEdit;
//   const NewTask({super.key, this.todoModel, this.isEdit = false});

//   @override
//   State<NewTask> createState() => _NewTaskState();
// }

// class _NewTaskState extends State<NewTask> {
//   TextEditingController imageController = TextEditingController();

//   TextEditingController descController = TextEditingController();

//   TextEditingController titleController = TextEditingController();

//   String? priorityController;
//   String? statusController;

//   TextEditingController dateController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.isEdit && widget.todoModel != null) {
//       titleController.text = widget.todoModel!.title ?? '';
//       descController.text = widget.todoModel!.description ?? '';
//       priorityController = widget.todoModel!.priority ?? '';
//       statusController = widget.todoModel!.status ?? '';
//     } else {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         setState(() {
//           statusController = S.of(context).waiting;
//           priorityController = S.of(context).low;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LogincubitDartCubit(),
//       child: BlocConsumer<LogincubitDartCubit, StatesLogin>(
//         listener: (context, state) {
//           if (state is EditTaskSuccess) {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => HomeScreen(setLocale: (Locale locale) {}),
//               ),
//               (route) => false,
//             );
//           } else if (state is StateAdTaskSuccess) {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => HomeScreen(setLocale: (Locale locale) {}),
//               ),
//               (route) => false,
//             );
//           } else if (state is StatesLoginError) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
//           }
//         },
//         builder: (context, state) {
//           var cubit = LogincubitDartCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 S.of(context).new_task,
//                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//               ),
//             ),
//             body: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 9.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     S.of(context).Enter_username,
//                     style: TextStyle(fontSize: 15.sp, color: textColor),
//                   ),
//                   Textfield(
//                     controller: titleController,
//                     textFieldHint: S.of(context).Enter_title,
//                   ),
//                   SizedBox(height: 10.h),

//                   Textfield(
//                     textBeforeTextFormFiled: S.of(context).task_description,
//                     maxLines: 3,
//                     controller: descController,
//                     textFieldHint: S.of(context).Enter_description,
//                   ),
//                   SizedBox(height: 10.h),
//                   Text(
//                     S.of(context).Priority,

//                     style: TextStyle(fontSize: 15.sp, color: textColor),
//                   ),
//                   DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                     ),
//                     value: priorityController,
//                     hint: Text(S.of(context).Select_Priority),
//                     items:
//                         [
//                           S.of(context).high,
//                           S.of(context).medium,
//                           S.of(context).low,
//                         ].map((String val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val),
//                           );
//                         }).toList(),
//                     onChanged: (String? value) {
//                       setState(() {
//                         priorityController = value!;
//                       });
//                     },
//                   ),
//                   Text(
//                     S.of(context).Status,
//                     style: TextStyle(fontSize: 15.sp, color: textColor),
//                   ),
//                   DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                     ),
//                     value: statusController,
//                     hint: Text(S.of(context).Select_Status),
//                     items:
//                         [
//                           S.of(context).waiting,
//                           S.of(context).inprogress,
//                           S.of(context).finished,
//                         ].map((String val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val),
//                           );
//                         }).toList(),
//                     onChanged: (String? value) {
//                       setState(() {
//                         statusController = value!;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 5.h),
//                   Text(
//                     S.of(context).Due_date,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontSize: 15.sp, color: textColor),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       // color: secondaryColor,
//                       borderRadius: BorderRadius.circular(10.r),
//                       border: Border.all(color: titleColor),
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         cubit.pickDate(context, dateController);
//                       },

//                       child: ListTile(
//                         dense: true, // reduces vertical padding
//                         title: Text(
//                           S.of(context).Select_Date,
//                           style:  TextStyle(
//                             color: textColor,
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         trailing: Icon(
//                           Icons.calendar_month,
//                           color: primaryColor,
//                           size: 25,
//                         ),
//                       ),
//                     ),
//                     //   child: InkWell(
//                     //     onTap: () {
//                     //       cubit.pickDate(context, dateController);
//                     //     },
//                     //   ),
//                   ),
//                   SizedBox(height: 25.h),
//                   Container(),

//                   CustomButton(
//                     title: widget.isEdit
//                         ? S.of(context).Edit_Task
//                         : S.of(context).Add_Task,
//                     onPressed: () async {
//                       if (widget.isEdit && widget.todoModel != null) {
//                         cubit.editTask(
//                           id: widget.todoModel!.id ?? '',
//                           titleController: titleController,
//                           descController: descController,
//                           priorityController: priorityController!,
//                           statusController: statusController!, ////<<<<<////
//                           dateController: dateController,
//                         );
//                       } else {
//                         cubit.addTask(
//                           titleController: titleController,
//                           descController: descController,
//                           priorityController: priorityController!,
//                           dateController: dateController,
//                           imageController: "",
//                           status: statusController!,
//                         ); // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (_) => HomeScreen()),
//                         // );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/home.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/todo_model.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTask extends StatefulWidget {
  final TodoModel? todoModel;
  final bool isEdit;
  const NewTask({super.key, this.todoModel, this.isEdit = false});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String? priorityController;
  String? statusController;
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.todoModel != null) {
      titleController.text = widget.todoModel!.title ?? '';
      descController.text = widget.todoModel!.description ?? '';
      priorityController = widget.todoModel!.priority ?? '';
      statusController = widget.todoModel!.status ?? '';
      dateController.text = widget.todoModel!.date ?? '';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          statusController = S.of(context).waiting;
          priorityController = S.of(context).low;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit(),
      child: BlocConsumer<LogincubitDartCubit, StatesLogin>(
        listener: (context, state) {
          if (state is EditTaskSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(setLocale: (Locale locale) {}),
              ),
              (route) => false,
            );
          } else if (state is StateAdTaskSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(setLocale: (Locale locale) {}),
              ),
              (route) => false,
            );
          } else if (state is StatesLoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        builder: (context, state) {
          var cubit = LogincubitDartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).new_task,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 9.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Enter_username, // keep as you wanted
                    style: TextStyle(fontSize: 15.sp, color: textColor),
                  ),
                  Textfield(
                    controller: titleController,
                    textFieldHint: S.of(context).Enter_title,
                  ),
                  SizedBox(height: 10.h),

                  Textfield(
                    textBeforeTextFormFiled: S.of(context).task_description,
                    maxLines: 3,
                    controller: descController,
                    textFieldHint: S.of(context).Enter_description,
                  ),
                  SizedBox(height: 10.h),

                  Text(
                    S.of(context).Priority,
                    style: TextStyle(fontSize: 15.sp, color: textColor),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    value: priorityController,
                    hint: Text(S.of(context).Select_Priority),
                    items:
                        [
                          S.of(context).high,
                          S.of(context).medium,
                          S.of(context).low,
                        ].map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        priorityController = value!;
                      });
                    },
                  ),

                  Text(
                    S.of(context).Status,
                    style: TextStyle(fontSize: 15.sp, color: textColor),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    value: statusController,
                    hint: Text(S.of(context).Select_Status),
                    items:
                        [
                          S.of(context).waiting,
                          S.of(context).inprogress,
                          S.of(context).finished,
                        ].map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        statusController = value!;
                      });
                    },
                  ),
                  SizedBox(height: 5.h),

                  Text(
                    S.of(context).Due_date,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.sp, color: textColor),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: titleColor),
                    ),
                    child: InkWell(
                      onTap: () async {
                        await cubit.pickDate(context, dateController);
                        setState(() {}); // refresh UI
                      },
                      child: ListTile(
                        dense: true,
                        title: Text(
                          dateController.text.isNotEmpty
                              ? dateController.text
                              : S.of(context).Select_Date,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Icon(
                          Icons.calendar_month,
                          color: primaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  CustomButton(
                    title: widget.isEdit
                        ? S.of(context).Edit_Task
                        : S.of(context).Add_Task,
                    onPressed: () async {
                      if (widget.isEdit && widget.todoModel != null) {
                        cubit.editTask(
                          id: widget.todoModel!.id ?? '',
                          titleController: titleController,
                          descController: descController,
                          priorityController: priorityController!,
                          statusController: statusController!,
                          dateController: dateController,
                        );
                      } else {
                        cubit.addTask(
                          titleController: titleController,
                          descController: descController,
                          priorityController: priorityController!,
                          dateController: dateController,
                          imageController: "", // keep empty as you want
                          status: statusController!,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
