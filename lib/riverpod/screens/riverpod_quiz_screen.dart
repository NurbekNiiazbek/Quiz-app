import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_06/common/constants/color/app_color.dart';
import 'package:flutter_project_06/common/widgets/buttons/custom_button.dart';
import 'package:flutter_project_06/common/widgets/custom_text.dart';
import 'package:flutter_project_06/common/widgets/dialogs/custom_dialog.dart';
import 'package:flutter_project_06/riverpod/providers/quiz_screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodQuizScreen extends ConsumerStatefulWidget {
  const RiverpodQuizScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiverpodQuizScreenState();
}

class _RiverpodQuizScreenState extends ConsumerState<RiverpodQuizScreen> {
  @override
  Widget build(BuildContext context) {
    log('RiverpodQuizScreen');
    final state = ref.watch(quizScreenNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
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
          ),
        ),
      ),
    );
  }

  void _checkAnswer({required bool userAnswer}) {
    final isOpenDialog = ref
        .read(quizScreenNotifierProvider.notifier)
        .checkAnswerAndOpenDialogIfNeeded(userAnswer: userAnswer);

    if (isOpenDialog) _openDialog();
  }

  void _openDialog() {
    openDialog(
      context,
      () {
        ref.read(quizScreenNotifierProvider.notifier).restart();

        Navigator.of(context).pop();
      },
    );
  }
}
