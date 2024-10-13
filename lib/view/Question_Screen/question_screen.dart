import 'dart:async';
import 'package:clonequiz_app/dummy_db.dart';
import 'package:clonequiz_app/utils/color_constants.dart';
import 'package:clonequiz_app/view/Result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  final String itemname;
  const QuestionScreen({super.key, required this.itemname});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Timer _timer; // Timer variable
  int _remainingTime = 30; // Countdown time in seconds
  var itemlist = [];
  dynamic count = 0;
  int? selectedanswerindex;
  int rightAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    items();
    startTimer(); // Start the timer when the screen initializes
  }

  void items() {
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

  void startTimer() {
    _remainingTime = 30; // Reset the timer for each question
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          // Handle timeout: Move to the next question
          _timer.cancel();
          handleNextQuestion();
        }
      });
    });
  }

  void handleNextQuestion() {
    if (count < itemlist.length - 1) {
      setState(() {
        count++;
        selectedanswerindex = null; // Reset selected answer
        _remainingTime = 30; // Reset timer for the next question
        startTimer(); // Restart the timer
      });
    } else {
      // Navigate to the result screen if it was the last question
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            RightansCount: rightAnswerCount,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Padding(
          padding: EdgeInsets.all(15.0),
          child: LinearPercentIndicator(
            width: 240,
            lineHeight: 20,
            percent:
                (count + 1) / itemlist.length, // Update this to show progress
            center: Text(
              "${((count + 1) / itemlist.length * 100).toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 15, color: ColorConstants.TextWhite),
            ),
            trailing: Icon(
              Icons.mood,
              color: ColorConstants.TextWhite,
            ),
            // ignore: deprecated_member_use
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: ColorConstants.primaryColor,
            progressColor: ColorConstants.Containerclr,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Circular progress indicator for the timer
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ColorConstants.primaryColor,
                  radius: 30,
                  child: CircularProgressIndicator(
                    value: _remainingTime / 30, // Normalize the value
                    backgroundColor: ColorConstants.Containerclr,
                    color: ColorConstants.TextWhite,
                  ),
                ),
                Text(
                  "$_remainingTime",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: ColorConstants.TextWhite),
                ),
              ],
            ),
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
                      borderRadius: BorderRadius.circular(15),
                    ),
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
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  handleNextQuestion(); // Use the same function to handle next question
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
              ),
          ],
        ),
      ),
    );
  }
}
