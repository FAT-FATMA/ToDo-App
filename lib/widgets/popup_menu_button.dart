// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
// import 'package:flutter_application_1/generated/l10n.dart';
// import 'package:flutter_application_1/scrreens/home.dart';
// import 'package:flutter_application_1/scrreens/new_task.dart';
// import 'package:flutter_application_1/todo_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TaskPopupMenu extends StatelessWidget {
//   final TodoModel todoModel;
//   //var cubit = LogincubitDartCubit.get(context);

//   TaskPopupMenu({super.key, required this.todoModel});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LogincubitDartCubit, StatesLogin>(
//       builder: (context, state) {
//         var cubit = LogincubitDartCubit.get(context);

//         return PopupMenuButton<String>(
//           icon: const Icon(Icons.more_vert),
//           itemBuilder: (context) => [
//             PopupMenuItem(
//               value: S.of(context).Edit,
//               child: Text(S.of(context).Edit),
//               onTap: () {
//                 Future.delayed(Duration.zero, () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) =>
//                           NewTask(todoModel: todoModel, isEdit: true),
//                     ),
//                   );
//                 });
//               },
//             ),
//             PopupMenuItem(
//               value: S.of(context).Delete,
//               child: Text(
//                 S.of(context).Delete,
//                 style: const TextStyle(color: Colors.red),
//               ),
//               onTap: () {
//                 Future.delayed(Duration.zero, () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text(S.of(context).Confirm_Delete),
//                       content: Text(S.of(context).confirm_massage),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context); // Close popup
//                           },
//                           child: Text(S.of(context).Cancel),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             cubit.deleteTask(todoModel.id ?? "");
//                             Navigator.pop(context); // Close dialog
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) =>
//                                     HomeScreen(setLocale: (Locale locale) {}),
//                               ),
//                               (route) => false,
//                             );
//                           },
//                           child: Text(
//                             S.of(context).Delete,
//                             style: const TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
