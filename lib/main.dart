import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:equina_task/app/start_app_cycle/views/splash_screen.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await ScreenUtil.ensureScreenSize();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LessonsProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MyApp._privateConstructor();

  static final MyApp _instance = MyApp._privateConstructor();

  static MyApp get instance => _instance;

  late final Future<int?> userIdFuture = getUserId();

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle: TextManager.medium(
                fontSize: 17,
              ).copyWith(color: black),
              color: white,
            ),
            textTheme: TextTheme(
              bodyLarge: TextManager.regular(),
              titleLarge: TextManager.bold(),
              labelLarge: TextManager.medium(),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
