import 'package:clonequiz_app/dummy_db.dart';
import 'package:clonequiz_app/main.dart';
import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/utils/image_constants.dart';
import 'package:clonequiz_app/view/Question_Screen/question_screen.dart';
import 'package:clonequiz_app/view/global_Widget/container_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, $Username",
              style: TextStyle(
                  color: ColorConstants.TextWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Let's make this day productive",
              style: TextStyle(
                  color: ColorConstants.TextWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              ImageConstants.profilepic,
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Move _Pointcontainer to the top
            _Pointcontainer(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Play",
                    style: TextStyle(
                        color: ColorConstants.TextWhite,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7),
                      itemCount: DummyDb.items.length,
                      itemBuilder: (context, index) => ContainerScreen(
                        oncontainerTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionScreen(
                                  itemname: DummyDb.items[index]["items"],
                                ),
                              ));
                        },
                        image: DummyDb.items[index]["images"],
                        items: DummyDb.items[index]["items"],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _Pointcontainer() {
    return Center(
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
            color: ColorConstants.Containerclr,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage(
                        ImageConstants.cuppic,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Ranking",
                          style: TextStyle(
                              color: ColorConstants.TextWhite,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "3333",
                          style: TextStyle(
                              color: ColorConstants.TextWhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage(
                        ImageConstants.coins,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Points",
                          style: TextStyle(
                              color: ColorConstants.TextWhite,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "350",
                          style: TextStyle(
                              color: ColorConstants.TextWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
