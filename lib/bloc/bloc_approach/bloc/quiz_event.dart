part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class UserAnswered extends QuizEvent {
  final bool userAnswer;

  UserAnswered({required this.userAnswer});
}

class Restart extends QuizEvent {}
