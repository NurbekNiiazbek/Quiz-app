import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_06/bloc/bloc_approach/bloc/quiz_bloc.dart';
import 'package:flutter_project_06/bloc/bloc_approach/bloc/quiz_bloc_state.dart';

import 'package:flutter_project_06/common/constants/color/app_color.dart';
import 'package:flutter_project_06/common/widgets/buttons/custom_button.dart';
import 'package:flutter_project_06/common/widgets/custom_text.dart';
import 'package:flutter_project_06/common/widgets/dialogs/custom_dialog.dart';

class BlocQuizScreen extends StatefulWidget {
  const BlocQuizScreen({super.key});

  @override
  _BlocQuizScreenState createState() => _BlocQuizScreenState();
}

class _BlocQuizScreenState extends State<BlocQuizScreen> {
  @override
  Widget build(BuildContext context) {
    log('BlocQuizScreen');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocConsumer<QuizBloc, QuizBlocState>(
            listener: (BuildContext context, QuizBlocState state) {
              if (state.isFinished) {
                _openDialog();
              }
            },
            builder: (BuildContext context, QuizBlocState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CustomText(text: state.question),
                  CustomButton(
                    text: 'TRUE',
                    onPressed: () => _checkAnswer(userAnswer: true),
                    backgroundColor: AppColor.green,
                  ),
                  CustomButton(
                    text: 'FALSE',
                    onPressed: () => _checkAnswer(userAnswer: false),
                    backgroundColor: AppColor.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: state.icons,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _checkAnswer({required bool userAnswer}) {
    context.read<QuizBloc>().add(UserAnswered(userAnswer: userAnswer));

    // if (isOpenDialog) _openDialog();
  }

  void _openDialog() {
    openDialog(
      context,
      () {
        context.read<QuizBloc>().add(Restart());

        Navigator.of(context).pop();
      },
    );
  }
}
