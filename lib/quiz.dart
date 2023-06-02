import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAns = [];
  var acScreen = "Start-screen";

  void switchScreen() {
    setState(() {
      acScreen = "Question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAns.add(answer);
    if (selectedAns.length == questions.length) {
      setState(() {
        acScreen = 'Result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAns = [];
    setState(() {
      acScreen = 'Start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (acScreen == "Question-screen") {
      screenWidget = QuestionScreen(onPressedAns: chooseAnswer);
    }
    if (acScreen == "Result-screen") {
      screenWidget = ResultScreen(
        resetQuiz: restartQuiz,
        chosenAns: selectedAns,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 141, 15, 135),
                Color.fromARGB(255, 252, 104, 227)
              ],
              stops: [0, 1],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
