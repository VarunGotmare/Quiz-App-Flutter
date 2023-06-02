import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.ans, this.ontap, {super.key});
  final void Function() ontap;
  final String ans;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 5,
        ),
        backgroundColor: const Color.fromARGB(183, 90, 10, 86),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: ontap,
      child: Text(ans),
    );
  }
}
