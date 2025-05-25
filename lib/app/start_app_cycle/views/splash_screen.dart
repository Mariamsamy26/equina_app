import 'dart:async';

import 'package:equina_task/app/home_cycle/views/root_screen.dart';
import 'package:equina_task/app/start_app_cycle/views/onbording_screen.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Sprash screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');

    print("Loaded user ID: ${userId}");

    Future.delayed(Duration(milliseconds: 1500), () {
      Navigation().goToScreenAndClearAll(
        context,
        (context) => userId != null ? RootScreen() : OnbordingScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    AppDimentions().appDimentionsInit(context);
    return SizedBox(
      height: AppDimentions().availableheightWithAppBar,
      width: AppDimentions().availableWidth,
      child: Image.asset("assets/images/full_splash.png", fit: BoxFit.cover),
    );
  }
}
