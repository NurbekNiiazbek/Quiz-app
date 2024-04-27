import 'package:flutter/material.dart';

void openDialog(BuildContext context, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Finished!'),
      content: const Text('You\'ve reached the end of the quiz.'),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: const Text('Restart'),
        ),
      ],
    ),
  );
}
