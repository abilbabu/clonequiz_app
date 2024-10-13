import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/view/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorConstants.primaryColor),
      home: HomeScreen(),
    );
  }
}
