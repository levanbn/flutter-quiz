import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool boo = data['user_answer'] == data['correct_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: boo
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 237, 223, 252),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 198, 18, 156),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 14, 183, 70),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
