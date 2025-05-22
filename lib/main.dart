import 'package:equina_task/app/home_cycle/views/root_screen.dart';
import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:equina_task/app/start_app_cycle/views/splash_screen.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  
  
  await ScreenUtil.ensureScreenSize();
  
  
 runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LessonsProvider()),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle: TextManager.medium(fontSize: 17).copyWith(color: black),
              color: white
            ),
            textTheme: TextTheme(
              bodyLarge: TextManager.regular(),
              titleLarge: TextManager.bold(),
              labelLarge: TextManager.medium(),
            ),
            
          ),

          //  home:  const RootScreen(),
          home:  const SplashScreen(),
        );
      },
    );
  }
}