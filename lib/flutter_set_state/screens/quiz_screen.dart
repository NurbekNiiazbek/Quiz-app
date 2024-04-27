import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_06/common/constants/color/app_color.dart';
import 'package:flutter_project_06/common/constants/icons/app_icons.dart';
import 'package:flutter_project_06/common/services/questions_service.dart';
import 'package:flutter_project_06/common/widgets/buttons/custom_button.dart';
import 'package:flutter_project_06/common/widgets/custom_text.dart';
import 'package:flutter_project_06/common/widgets/dialogs/custom_dialog.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> icons = [];

  @override
  Widget build(BuildContext context) {
    log('QuizScreen');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomText(text: service.nextQuestion()),
              CustomButton(
                text: 'TRUE',
                onPressed: () {
                  _checkAnswer(userAnswer: true);
                },
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
                  children: icons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswer({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    setState(() {
      !service.isFinished() ? service.goToNext() : _openDialog();
    });
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    userAnswer == correctAnswer
        ? icons.add(AppIcons.correctIcon)
        : icons.add(AppIcons.falseIcon);
  }

  void _openDialog() {
    openDialog(
      context,
      () {
        service.restart();
        icons.clear();

        Navigator.of(context).pop();

        setState(() {});
      },
    );
  }
}
