import 'package:exam1_app/controller/excercise_controller.dart';
import 'package:exam1_app/utils/route_utils.dart';
import 'package:exam1_app/views/screens/difficulty_page.dart';
import 'package:exam1_app/views/screens/excercise_page.dart';
import 'package:exam1_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExcerciseController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.homePage,
      routes: {
        MyRoute.homePage: (context) => const HomePage(),
        MyRoute.excercisePage: (context) => const ExcercisePage(),
        MyRoute.defficultyPage: (context) => const DifficultyPage(),
      },
    );
  }
}
