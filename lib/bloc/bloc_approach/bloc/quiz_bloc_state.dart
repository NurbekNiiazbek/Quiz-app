import 'package:flutter/material.dart';

class QuizBlocState {
  final String question;
  final List<Widget> icons;
  final bool isFinished;

  QuizBlocState({
    required this.question,
    required this.icons,
    required this.isFinished,
  });
}
