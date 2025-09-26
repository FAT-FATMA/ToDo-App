import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Todo_model.dart';
import 'package:flutter_application_1/cash_helper.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/scrreens/home.dart';
import 'package:flutter_application_1/widgets/prof_modeel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For date formatting

part 'logincubit_dart_state.dart';

class LogincubitDartCubit extends Cubit<StatesLogin> {
  LogincubitDartCubit() : super(StatesLoginInitial());

  static LogincubitDartCubit get(context) => BlocProvider.of(context);

  void login(
    TextEditingController phoneController,
    TextEditingController passwordController,
    context,
  ) {
    DioHelper.requestPost(
          endPoint: "/auth/login",
          data: {
            "phone": phoneController.text,
            "password": passwordController.text,
          },
        )
        .then((response) {
          print(response.data);

          CashHelper.saveData(
            key: "token",
            value: response.data['access_token'],
          );
          CashHelper.saveData(
            key: "refresh_token",
            value: response.data['refresh_token'],
          );
          DioHelper.init();
          print("object ${response.data['access_token']}");

          print("objecdsadasdasdsat ${CashHelper.getData(key: "token")}");

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(setLocale: (Locale) {}),
            ),
            (route) => false,
          );
        })
        .catchError((error) {
          print("Error: $error");
        });
  }

  void register(
    TextEditingController phoneController,
    TextEditingController passwordController,
    TextEditingController displayNameController,
    TextEditingController yearsOfExperienceController,
String level,
    context,
  ) {
    DioHelper.requestPost(
          endPoint: '/auth/register',
          data: {
            'phone': phoneController.text,
            'password': passwordController.text,
            'displayName': displayNameController.text,
            'experienceYears': yearsOfExperienceController.text,
            "address": "d,sal;d,sal;",
            "level": level, // ✅ correct
          },
        )
        .then((response) {
          print(response.data);

          CashHelper.saveData(
            key: "token",
            value: response.data['access_token'],
          );
          CashHelper.saveData(
            key: "refresh_token",
            value: response.data['refresh_token'],
          );
          DioHelper.init();
          print("object ${response.data['access_token']}");

          print("objecdsadasdasdsat ${CashHelper.getData(key: "token")}");

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(setLocale: (Locale) {}),
            ),
            (route) => false,
          );
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to sign up. Please try again.')),
          );
        });
  }

  void addTask({
    required TextEditingController titleController,
    required TextEditingController descController,
    required String priorityController,
    required TextEditingController dateController,
    required String imageController,
    required String status, ////<<<<</////
  }) {
    DioHelper.requestPost(
          endPoint: "/todos",
          data: {
            "title": titleController.text,
            "desc": descController.text,
            "priority": priorityController,
            "status": status,
            "date": dateController.text,
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPpAh63HncAuJOC6TxWkGLYpS0WwNXswz9MA&s",
          },
        )
        .then((response) {
          print(response.data);
          emit(StateAdTaskSuccess(TodoModel.fromJson(response.data)));
        })
        .catchError((error) {
          print('Error: $error');
        });
  }

  void deleteTask(String id) {
    DioHelper.requestDelete(endPoint: "/todos/$id")
        .then((response) {
          emit(DeleteTaskSuccess(TodoModel.fromJson(response.data)));
        })
        .catchError((error) {
          emit(StatesLoginError(error.toString()));
        });
  }

  void refreshToken() {
    DioHelper.requestGet(endPoint: "/auth/refresh")
        .then((response) {
          CashHelper.saveData(
            key: "token",
            value: response.data['access_token'],
          );

          DioHelper.init();
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  void editTask({
    required String id,
    required TextEditingController titleController,
    required TextEditingController descController,
    required String priorityController,
    // required TextEditingController dateController,
    required String statusController,
    required TextEditingController dateController, //////<<<<</////
  }) {
    DioHelper.requestEdit(
          endPoint: "/todos/$id",
          data: {
            "title": titleController.text,
            "desc": descController.text,
            "priority": priorityController,
            "status": statusController, /////<<<<</////
            //  "date": dateController.text,
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPpAh63HncAuJOC6TxWkGLYpS0WwNXswz9MA&s",
          },
        )
        .then((response) {
          emit(EditTaskSuccess(TodoModel.fromJson(response.data)));
        })
        .catchError((error) {
          emit(StatesLoginError(error.toString()));
        });
  }

  void TaskList() {
    DioHelper.requestGet(endPoint: "/todos?page=1")
        .then((response) {
          print(response.data);
          emit((StatesGatData(response.data)));
        })
        .catchError((error) {
          print('Error: $error');
          emit(StatesLoginError(error.toString()));
        });
  }

  Future<void> pickDate(context, TextEditingController dateController) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Today's date
      firstDate: DateTime(2020), // Earliest date
      lastDate: DateTime(2050), // Latest date
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  ProfModeel? profModeel;
  void profile() {
    DioHelper.requestGet(endPoint: "/auth/profile")
        .then((value) {
          log(value.data.toString());
          log(value.data["displayName"]);
          profModeel = ProfModeel.fromJson(value.data);
          emit(GetPorfileDataSuccessState());
        })
        .catchError((error) {
          emit(GetPorfileDataErrorState());
        });
  }
}
