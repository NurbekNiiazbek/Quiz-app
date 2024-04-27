import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_06/bloc/cubit_approach/cubit/quiz_cubit.dart';
import 'package:flutter_project_06/bloc/cubit_approach/cubit/quiz_cubit_state.dart';
import 'package:flutter_project_06/common/constants/color/app_color.dart';
import 'package:flutter_project_06/common/widgets/buttons/custom_button.dart';
import 'package:flutter_project_06/common/widgets/custom_text.dart';
import 'package:flutter_project_06/common/widgets/dialogs/custom_dialog.dart';

class CubitQuizScreen extends StatefulWidget {
  const CubitQuizScreen({super.key});

  @override
  _CubitQuizScreenState createState() => _CubitQuizScreenState();
}

class _CubitQuizScreenState extends State<CubitQuizScreen> {
  @override
  Widget build(BuildContext context) {
    log('CubitQuizScreen');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocBuilder<QuizCubit, QuizCubitState>(
            builder: (BuildContext context, QuizCubitState state) {
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
    final isOpenDialog = context
        .read<QuizCubit>()
        .checkAnswerAndOpenDialogIfNeeded(userAnswer: userAnswer);

    if (isOpenDialog) _openDialog();
  }

  void _openDialog() {
    openDialog(
      context,
      () {
        context.read<QuizCubit>().restart();

        Navigator.of(context).pop();
      },
    );
  }
}
