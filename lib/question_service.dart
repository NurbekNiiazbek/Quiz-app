import 'dart:developer';

import 'package:flutter_project_06/examination.dart';

class QuestionService {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Osh city is the capital of Kyrgyzstan.', false),
    Question('Flutter is made by Facebook.', false),
    Question('Turkiye is a neighbor of Kyrgyzstan.', false),
    Question('Kyrgyzstan is located in Asia.', true),
    Question('Toyota is made in Japan', true),
  ];

  void nextQuestion() {
    if (_questionNumber <= _questionBank.length - 2) {
      _questionNumber++;
    }
    log(_questionBank.length as String);
    log(_questionNumber as String);
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
