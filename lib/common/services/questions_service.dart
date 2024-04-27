import 'dart:developer';

import 'package:flutter_project_06/common/data/questions_data.dart';

class QuestionsService {
  int index = 0;

  /// [questions]

  String nextQuestion() {
    return questions[index].question;
  }

  void goToNext() {
    if (index < questions.length - 1) {
      index++;
      log('goToNext.index: $index');
    }
  }

  bool getAnswer() {
    return questions[index].answer;
  }

  bool isFinished() {
    return questions.length - 1 == index;
  }

  void restart() {
    index = 0;
  }
}

final QuestionsService service = QuestionsService();
