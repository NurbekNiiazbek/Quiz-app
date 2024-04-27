import 'package:flutter/material.dart';
import 'package:flutter_project_06/common/constants/icons/app_icons.dart';
import 'package:flutter_project_06/common/services/questions_service.dart';
import 'package:get/get.dart';

class GetxQuizPageController extends GetxController {
  RxList<Widget> icons = <Widget>[].obs;

  RxString question = ''.obs;

  @override
  void onInit() {
    _getNextQuestion();
    super.onInit();
  }

  void _getNextQuestion() {
    question.value = service.nextQuestion();
  }

  bool checkAnswerAndOpenDialogIfNeeded({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    if (!service.isFinished()) {
      service.goToNext();

      _getNextQuestion();
      return false;
    } else {
      _getNextQuestion();
      return true;
    }
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    userAnswer == correctAnswer
        ? icons.add(AppIcons.correctIcon)
        : icons.add(AppIcons.falseIcon);
  }

  void _clearIcons() {
    icons.clear();
  }

  void restart() {
    _clearIcons();
    service.restart();
  }
}
