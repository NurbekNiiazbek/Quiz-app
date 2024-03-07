import 'package:flutter/material.dart';
import 'package:flutter_project_06/Question_service.dart';
import 'package:flutter_project_06/quiz_screen.dart';

QuizBrain quizbrain = QuizBrain();

void main() {
  runApp(const Quizer());
}

class Quizer extends StatelessWidget {
  const Quizer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Quizzy(),
          ),
        ),
      ),
    );
  }
}
