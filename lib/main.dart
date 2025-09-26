import 'package:flutter/material.dart';
import 'package:flutter_application_1/cash_helper.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/splash.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/theme/theme_manager.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await DioHelper.init();

  runApp(
    Phoenix(
      child: ChangeNotifierProvider(
        create: (_) => ThemeManager(),
        child: const MyApp(startLocale: Locale('en')),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required Locale startLocale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    // load saved lang from cache
    String? langCode = CashHelper.getData(key: "language");
    if (langCode != null) {
      _locale = Locale(langCode);
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      CashHelper.saveData(key: "language", value: locale.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Consumer<ThemeManager>(
          builder: (context, themeManager, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TODO APP',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeManager.themeMode,

              //  language settings
              locale: _locale,
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              // first screen
              home: SplashScreen(
                onFinished: () {},
                setLocale: (Locale locale) {
                  setLocale(locale);
                },
              ),
            );
          },
        );
      },
    );
  }
}
