import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_06/bloc/bloc_approach/bloc/quiz_bloc_state.dart';

import 'package:flutter_project_06/common/constants/icons/app_icons.dart';

import 'package:flutter_project_06/common/services/questions_service.dart';

part 'quiz_event.dart';

class QuizBloc extends Bloc<QuizEvent, QuizBlocState> {
  QuizBloc()
      : super(QuizBlocState(
          question: service.nextQuestion(),
          icons: <Widget>[],
          isFinished: false,
        )) {
    on<UserAnswered>(_userAnswered);

    on<Restart>(_restart);
  }

  bool _isFinished() {
    final result = service.isFinished();

    log('_isFinished.result: $result');

    return result;
  }

  void _userAnswered(
    UserAnswered event,
    Emitter<QuizBlocState> emit,
  ) {
    final answer = service.getAnswer();
    if (!_isFinished()) {
      service.goToNext();
      _addIcon(emit: emit, userAnswer: event.userAnswer, correctAnswer: answer);
    } else {
      _addIcon(emit: emit, userAnswer: event.userAnswer, correctAnswer: answer);
    }
  }

  void _addIcon({
    required Emitter<QuizBlocState> emit,
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    if (userAnswer == correctAnswer) {
      emit(
        QuizBlocState(
          icons: _getIcons(true),
          question: service.nextQuestion(),
          isFinished: _isFinished(),
        ),
      );
    } else {
      emit(
        QuizBlocState(
          icons: _getIcons(false),
          question: service.nextQuestion(),
          isFinished: _isFinished(),
        ),
      );
    }
  }

  List<Widget> _getIcons(bool correct) {
    correct
        ? state.icons.add(AppIcons.correctIcon)
        : state.icons.add(AppIcons.falseIcon);
    return state.icons;
  }

  void _restart(
    Restart event,
    Emitter<QuizBlocState> emit,
  ) {
    service.restart();
    _clear(emit);
  }

  void _clear(Emitter emit) {
    emit(QuizBlocState(
        icons: <Widget>[],
        question: service.nextQuestion(),
        isFinished: false));
  }
}
