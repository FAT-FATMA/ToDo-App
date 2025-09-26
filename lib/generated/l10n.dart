// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Task Management &To-Do List`
  String get Task_Management_ToDo_List {
    return Intl.message(
      'Task Management &To-Do List',
      name: 'Task_Management_ToDo_List',
      desc: '',
      args: [],
    );
  }

  /// `This productive tool is designed to helpyou better manage your task project-wise conveniently!`
  String get productive_tool {
    return Intl.message(
      'This productive tool is designed to helpyou better manage your task project-wise conveniently!',
      name: 'productive_tool',
      desc: '',
      args: [],
    );
  }

  /// `let's Start`
  String get lets_Start {
    return Intl.message('let\'s Start', name: 'lets_Start', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `password`
  String get password {
    return Intl.message('password', name: 'password', desc: '', args: []);
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message('Sign Up', name: 'Sign_Up', desc: '', args: []);
  }

  /// `Didn't have an account?`
  String get any_account {
    return Intl.message(
      'Didn\'t have an account?',
      name: 'any_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Now`
  String get Sign_Up_Now {
    return Intl.message('Sign Up Now', name: 'Sign_Up_Now', desc: '', args: []);
  }

  /// `Sign Up here`
  String get Sign_Up_here {
    return Intl.message(
      'Sign Up here',
      name: 'Sign_Up_here',
      desc: '',
      args: [],
    );
  }

  /// `Display Name`
  String get displayName {
    return Intl.message(
      'Display Name',
      name: 'displayName',
      desc: '',
      args: [],
    );
  }

  /// `Years of experience`
  String get Years_experience {
    return Intl.message(
      'Years of experience',
      name: 'Years_experience',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `MyTasks`
  String get MyTasks {
    return Intl.message('MyTasks', name: 'MyTasks', desc: '', args: []);
  }

  /// `All`
  String get All {
    return Intl.message('All', name: 'All', desc: '', args: []);
  }

  /// `Inprogress`
  String get Inprogress {
    return Intl.message('Inprogress', name: 'Inprogress', desc: '', args: []);
  }

  /// `Waiting`
  String get Waiting {
    return Intl.message('Waiting', name: 'Waiting', desc: '', args: []);
  }

  /// `Finished`
  String get Finished {
    return Intl.message('Finished', name: 'Finished', desc: '', args: []);
  }

  /// `Add new task`
  String get new_task {
    return Intl.message('Add new task', name: 'new_task', desc: '', args: []);
  }

  /// `Enter your username`
  String get Enter_username {
    return Intl.message(
      'Enter your username',
      name: 'Enter_username',
      desc: '',
      args: [],
    );
  }

  /// `Enter title here....`
  String get Enter_title {
    return Intl.message(
      'Enter title here....',
      name: 'Enter_title',
      desc: '',
      args: [],
    );
  }

  /// `add your task description`
  String get task_description {
    return Intl.message(
      'add your task description',
      name: 'task_description',
      desc: '',
      args: [],
    );
  }

  /// `Enter description here....`
  String get Enter_description {
    return Intl.message(
      'Enter description here....',
      name: 'Enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get Priority {
    return Intl.message('Priority', name: 'Priority', desc: '', args: []);
  }

  /// `Select Priority`
  String get Select_Priority {
    return Intl.message(
      'Select Priority',
      name: 'Select_Priority',
      desc: '',
      args: [],
    );
  }

  /// `low`
  String get low {
    return Intl.message('low', name: 'low', desc: '', args: []);
  }

  /// `medium`
  String get medium {
    return Intl.message('medium', name: 'medium', desc: '', args: []);
  }

  /// `high`
  String get high {
    return Intl.message('high', name: 'high', desc: '', args: []);
  }

  /// `Status`
  String get Status {
    return Intl.message('Status', name: 'Status', desc: '', args: []);
  }

  /// `Select Status`
  String get Select_Status {
    return Intl.message(
      'Select Status',
      name: 'Select_Status',
      desc: '',
      args: [],
    );
  }

  /// `waiting`
  String get waiting {
    return Intl.message('waiting', name: 'waiting', desc: '', args: []);
  }

  /// `finished`
  String get finished {
    return Intl.message('finished', name: 'finished', desc: '', args: []);
  }

  /// `inProgress`
  String get inprogress {
    return Intl.message('inProgress', name: 'inprogress', desc: '', args: []);
  }

  /// `Due date`
  String get Due_date {
    return Intl.message('Due date', name: 'Due_date', desc: '', args: []);
  }

  /// `Select Date`
  String get Select_Date {
    return Intl.message('Select Date', name: 'Select_Date', desc: '', args: []);
  }

  /// `Add Task`
  String get Add_Task {
    return Intl.message('Add Task', name: 'Add_Task', desc: '', args: []);
  }

  /// `Edit Task`
  String get Edit_Task {
    return Intl.message('Edit Task', name: 'Edit_Task', desc: '', args: []);
  }

  /// `Task Details`
  String get Task_Details {
    return Intl.message(
      'Task Details',
      name: 'Task_Details',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message('Edit', name: 'Edit', desc: '', args: []);
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Confirm Delete`
  String get Confirm_Delete {
    return Intl.message(
      'Confirm Delete',
      name: 'Confirm_Delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task?`
  String get confirm_massage {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'confirm_massage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `NAME`
  String get NAME {
    return Intl.message('NAME', name: 'NAME', desc: '', args: []);
  }

  /// `PHONE`
  String get PHONE {
    return Intl.message('PHONE', name: 'PHONE', desc: '', args: []);
  }

  /// `LEVEL`
  String get lEVEL {
    return Intl.message('LEVEL', name: 'lEVEL', desc: '', args: []);
  }

  /// `YEARS OF EXPERIENCE`
  String get YEARS_OF_EXPERIENCE {
    return Intl.message(
      'YEARS OF EXPERIENCE',
      name: 'YEARS_OF_EXPERIENCE',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get allready_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'allready_have_account',
      desc: '',
      args: [],
    );
  }

  /// `No Tasks yet!`
  String get NoTasks {
    return Intl.message('No Tasks yet!', name: 'NoTasks', desc: '', args: []);
  }

  /// `level`
  String get level {
    return Intl.message('level', name: 'level', desc: '', args: []);
  }

  /// `midLevel`
  String get midLevel {
    return Intl.message('midLevel', name: 'midLevel', desc: '', args: []);
  }

  /// `junior`
  String get junior {
    return Intl.message('junior', name: 'junior', desc: '', args: []);
  }

  /// `senior`
  String get senior {
    return Intl.message('senior', name: 'senior', desc: '', args: []);
  }

  /// `fresh`
  String get fresh {
    return Intl.message('fresh', name: 'fresh', desc: '', args: []);
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message('SignIn', name: 'SignIn', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
