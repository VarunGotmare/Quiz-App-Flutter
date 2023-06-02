import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.resetQuiz, required this.chosenAns});
  final List<String> chosenAns;
  final void Function() resetQuiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_ans': questions[i].ans[0],
        'user_ans': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totQuest = questions.length;
    final corQuest = summaryData.where((data) {
      return data['correct_ans'] == data['user_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your answered $corQuest out of $totQuest  questions right",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              child: QuestionsSummary(summaryData: summaryData),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: resetQuiz,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 246, 211, 255),
              ),
              label: const Text(
                "Restart Quiz?",
              ),
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
