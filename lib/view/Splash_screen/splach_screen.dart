import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/utils/image_constants.dart';
import 'package:clonequiz_app/view/Getstart_screen/getstart_screen.dart';

import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetstartScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(height: 250, image: AssetImage(ImageConstants.logo)),
            Text(
              "INTELLECTUAL GAME",
              style: TextStyle(color: ColorConstants.TextWhite),
            )
          ],
        ),
      ),
    );
  }
}
