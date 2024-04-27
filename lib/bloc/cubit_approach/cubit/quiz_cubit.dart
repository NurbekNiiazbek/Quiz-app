import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_06/bloc/cubit_approach/cubit/quiz_cubit_state.dart';
import 'package:flutter_project_06/common/constants/icons/app_icons.dart';
import 'package:flutter_project_06/common/services/questions_service.dart';

class QuizCubit extends Cubit<QuizCubitState> {
  QuizCubit()
      : super(QuizCubitState(
            question: service.nextQuestion(), icons: <Widget>[]));

  bool checkAnswerAndOpenDialogIfNeeded({required bool userAnswer}) {
    if (!service.isFinished()) {
      final answer = service.getAnswer();
      service.goToNext();
      _addIcon(userAnswer: userAnswer, correctAnswer: answer);
      return false;
    } else {
      _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());
      return true;
    }
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    if (userAnswer == correctAnswer) {
      emit(QuizCubitState(
          icons: _getIcons(true), question: service.nextQuestion()));
    } else {
      emit(QuizCubitState(
          icons: _getIcons(false), question: service.nextQuestion()));
    }
  }

  List<Widget> _getIcons(bool correct) {
    correct
        ? state.icons.add(AppIcons.correctIcon)
        : state.icons.add(AppIcons.falseIcon);
    return state.icons;
  }

  void _clear() {
    emit(QuizCubitState(icons: <Widget>[], question: service.nextQuestion()));
  }

  void restart() {
    service.restart();
    _clear();
  }
}
