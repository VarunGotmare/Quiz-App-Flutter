import 'package:flutter/material.dart';
import 'package:quiz_app/ansbut.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onPressedAns});
  final void Function(String answer) onPressedAns;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var queidx = 0;

  void nextque(String answer) {
    widget.onPressedAns(answer);
    setState(() {
      queidx++;
    });
  }

  @override
  Widget build(context) {
    final question = questions[queidx];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.getShuffled().map((ans) {
              return AnswerButton(ans, () {
                nextque(ans);
              });
            }),
          ],
        ),
      ),
    );
  }
}
