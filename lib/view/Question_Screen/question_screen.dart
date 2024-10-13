import 'package:clonequiz_app/dummy_db.dart';
import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/view/Result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final String itemname;
  const QuestionScreen({super.key, required this.itemname});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  items() {
    print(widget.itemname);
    if (widget.itemname == "Sports") {
      itemlist = DummyDb.SportsList;
    } else if (widget.itemname == "General Knowledge") {
      itemlist = DummyDb.gkList;
    } else if (widget.itemname == "Maths") {
      itemlist = DummyDb.mathsList;
    } else if (widget.itemname == "History") {
      itemlist = DummyDb.historyList;
    } else if (widget.itemname == "Science ") {
      itemlist = DummyDb.ScienceList;
    } else {
      itemlist = DummyDb.technologyList;
    }
  }

  @override
  void initState() {
    super.initState();
    items();
  }

  dynamic count = 0;
  int? selectedanswerindex;
  int rightAnswerCount = 0;
  var itemlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        actions: [
          Text(
            "${count + 1} / ${itemlist.length}",
            style: TextStyle(color: ColorConstants.TextWhite),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        itemlist[count]["question"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorConstants.TextWhite),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorConstants.Containerclr, width: 5),
                        color: ColorConstants.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
            ),
            Column(
                children: List.generate(
              itemlist[count]["options"].length,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    if (selectedanswerindex == null) {
                      setState(() {
                        selectedanswerindex = index;

                        if (index == itemlist[count]["answerindex"]) {
                          rightAnswerCount++;
                        }
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: getcolor(index), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemlist[count]["options"][index],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: ColorConstants.TextWhite),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          color: ColorConstants.Containerclr,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  setState(() {});

                  selectedanswerindex = null;
                  if (count < itemlist.length - 1) {
                    count++;
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            RightansCount: rightAnswerCount,
                          ),
                        ));
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstants.Containerclr),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: ColorConstants.TextWhite),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Color getcolor(int optionIndex) {
    if (selectedanswerindex != null &&
        optionIndex == itemlist[count]["answerindex"]) {
      return ColorConstants.Green;
    }

    if (selectedanswerindex == optionIndex) {
      if (selectedanswerindex == itemlist[count]["answerindex"]) {
        return ColorConstants.Green;
      } else {
        return ColorConstants.Red;
      }
    } else {
      return ColorConstants.Containerclr;
    }
  }
}
