import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var colorAns = const Color.fromARGB(255, 238, 75, 63);
            if (data['user_ans'] == data['correct_ans']) {
              colorAns = const Color.fromARGB(255, 141, 245, 144);
            }
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: colorAns,
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['questions'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        data['user_ans'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        data['correct_ans'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
