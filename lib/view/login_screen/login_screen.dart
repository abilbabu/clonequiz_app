import 'package:clonequiz_app/main.dart';
import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/view/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController usercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Title(),
            SizedBox(height: 30),
            textformfield(),
            SizedBox(height: 40),
            Inkwell(context)
          ],
        ),
      ),
    );
  }

  Row Title() {
    return Row(
      children: [
        Text("Enter Username",
            style: TextStyle(
                color: ColorConstants.TextWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Spacer(),
      ],
    );
  }

  Form textformfield() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: usercontroller,
        decoration: InputDecoration(
          hintText: "Enter Username",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorConstants.Containerclr, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorConstants.Containerclr, width: 1)),
        ),
        style: TextStyle(color: ColorConstants.TextWhite),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        },
      ),
    );
  }

  InkWell Inkwell(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
        if (_formKey.currentState!.validate()) {
          Username = usercontroller.text;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (Route) => false);
        }
      },
      child: Container(
        height: 35,
        width: 150,
        decoration: BoxDecoration(
          color: ColorConstants.Containerclr,
          border: Border.all(color: ColorConstants.Containerclr),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text("CONTINUE",
              style: TextStyle(
                color: ColorConstants.TextWhite,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
