import 'package:flutter/material.dart';
import 'package:flutter_application_1/cash_helper.dart';
import 'package:flutter_application_1/cubit/logincubit_dart_cubit.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/new_task.dart';
import 'package:flutter_application_1/scrreens/profile_screen.dart';
import 'package:flutter_application_1/scrreens/welcome.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/theme/theme_manager.dart';
import 'package:flutter_application_1/todo_model.dart';
import 'package:flutter_application_1/widgets/home_custom_button.dart';
import 'package:flutter_application_1/widgets/todo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final void Function(Locale) setLocale;

  const HomeScreen({super.key, required this.setLocale});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

String? selected;
bool isarDark = false;

//ThemeMode _themeMode = ThemeMode.light;

class _MyWidgetState extends State<HomeScreen> {
  List<TodoModel>? listOld;
  List<TodoModel>? listTodoModel;

  @override
  void initState() {
    // print("object");

    refreshToken();
    //fetchData();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = S.of(context).All;
      });
    });
  }

  void refreshToken() {
    // print("object");
    DioHelper.requestGet(
          endPoint: "/auth/refresh-token",
          query: {"token": CashHelper.getData(key: "refresh_token")},
        )
        .then((response) {
          CashHelper.saveData(
            key: "token",
            value: response.data['access_token'],
          );

          DioHelper.init();
          fetchData();
          // setState(() {});
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  void fetchData() {
    DioHelper.requestGet(endPoint: "/todos")
        .then((value) {
          print(value.data);
          print(value.data.length);

          listOld = (value.data as List)
              .map((item) => TodoModel.fromJson(item))
              .toList();
          listTodoModel = (value.data as List)
              .map((item) => TodoModel.fromJson(item))
              .toList();

          setState(() {});
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogincubitDartCubit(),
      // create: (context) => LogincubitDartCubit()..userLogin(email: '', password: ''),
      child: BlocBuilder<LogincubitDartCubit, StatesLogin>(
        builder: (context, sStatesLogintate) {
          var cubit = LogincubitDartCubit.get(context);
          final themeManager = Provider.of<ThemeManager>(context);

          return Scaffold(
            //  backgroundColor: textButton,
            appBar: AppBar(
              //  backgroundColor: Colors.white,
              //surfaceTintColor: Colors.white,
              // elevation: 5,
              title: Text(S.of(context).Home),
              actions: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()),
                    );
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () {
                    // toggle language
                    String newLang =
                        Localizations.localeOf(context).languageCode == 'en'
                        ? 'ar'
                        : 'en';

                    // save in local storage
                    CashHelper.saveData(key: "language", value: newLang);
                    Phoenix.rebirth(context);
                    // set new locale
                    widget.setLocale(Locale(newLang));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WelcomeScreen()),
                    );
                    CashHelper.removeData(key: 'token');
                    CashHelper.removeData(key: 'refresh_token');
                  },
                ),
              ],
            ),

            body: Padding(
              padding: EdgeInsets.all(15.h),
              child: listTodoModel == null
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              S.of(context).MyTasks,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //here//
                                HomeCustomButton(
                                  isSelected: selected == S.of(context).All,

                                  onPressed: () {
                                    listTodoModel = listOld!.toList();
                                    setState(
                                      () => selected = S.of(context).All,
                                    );
                                  },
                                  title: (S.of(context).All),
                                ),
                                SizedBox(width: 12.w),

                                //here//
                                HomeCustomButton(
                                  isSelected:
                                      selected == S.of(context).inprogress,
                                  onPressed: () {
                                    listTodoModel = listOld!
                                        .where(
                                          (todo) => todo.status == "inProgress",
                                        )
                                        .toList();
                                    setState(
                                      () => selected = S.of(context).inprogress,
                                    );
                                  },
                                  title: (S.of(context).Inprogress),
                                ),
                                SizedBox(width: 12.w),

                                //here//
                                HomeCustomButton(
                                  isSelected: selected == S.of(context).waiting,
                                  onPressed: () {
                                    //     return TodoList(
                                    //   listTodoModel: listTodoModel.where(
                                    //       (todo) => todo.status == 'waiting').toList(),
                                    //   imageSize: 50.0,
                                    //   borderRadius: 8.0,
                                    // );
                                    listTodoModel = listOld!
                                        .where(
                                          (todo) => todo.status == "waiting",
                                        )
                                        .toList();
                                    setState(
                                      () => selected = S.of(context).waiting,
                                    );
                                  },
                                  title: (S.of(context).Waiting),
                                ),
                                SizedBox(width: 12.w),

                                //here//
                                HomeCustomButton(
                                  isSelected:
                                      selected == S.of(context).finished,
                                  onPressed: () {
                                    //     return TodoList(
                                    //   listTodoModel: listTodoModel.where(
                                    //       (todo) => todo.status == 'finished').toList(),
                                    //   imageSize: 50.0,
                                    //   borderRadius: 8.0,
                                    // );
                                    listTodoModel = listOld!
                                        .where(
                                          (todo) => todo.status == "finished",
                                        )
                                        .toList();
                                    setState(
                                      () => selected = S.of(context).finished,
                                    );
                                  },
                                  title: (S.of(context).Finished),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),

                          listTodoModel!.isEmpty
                              ? Center(
                                  child: Text(
                                    S.of(context).NoTasks,
                                    style: TextStyle(color: primaryColor),
                                  ),
                                )
                              : BlocBuilder<LogincubitDartCubit, StatesLogin>(
                                  // listener: (context, state) {},
                                  builder: (context, state) {
                                    return TodoList(
                                      listTodoModel: listTodoModel!,
                                      imageSize: 50.r,
                                      borderRadius: 10.h,
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min, // so it only takes needed space
              children: [
                FloatingActionButton(
                  shape: const CircleBorder(),
                  //backgroundColor: primaryColor,
                  //foregroundColor: secondaryColor, // icon color
                  // button color
                  heroTag: "btn1",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,

                  // primaryColor
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NewTask()),
                    );
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10.h), // spacing
                FloatingActionButton(
                  shape: const CircleBorder(),

                  //   backgroundColor: secondaryColor, // button color
                  mini: true,
                  heroTag: "btn2",
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.black,

                  onPressed: () {
                    themeManager.toggleTheme();
                  },
                  child: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
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
