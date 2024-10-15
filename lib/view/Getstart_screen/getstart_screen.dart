import 'package:carousel_slider/carousel_slider.dart';
import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/view/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class GetstartScreen extends StatelessWidget {
  GetstartScreen({super.key});

  final List<String> imgList = [
    'assets/image/firqu.webp',
    'assets/image/sec.avif',
    'assets/image/thi.webp',
    'assets/image/foure.jpg',
    'assets/image/five.avif',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
              ),
              items: imgList.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's Playing",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorConstants.TextWhite,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorConstants.TextWhite,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
