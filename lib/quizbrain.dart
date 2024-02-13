import 'package:flutter/material.dart';

import 'alert_dialog.dart';
import 'question.dart';

/// Created by Coder Odilov on 25/12/2023.

class QuestionBrain {
  int _questionNumber = 0;

  final List<Question> _questionsBank = [
    Question(
        question: 'About 36 and 42 islands make up New York City.',
        questionAnswer: true),
    Question(
        question: 'Only one capital exists in South Africa.',
        questionAnswer: false),
    Question(
        question: 'The largest ocean in the world is the Atlantic Ocean.',
        questionAnswer: false),
    Question(
        question: 'The tallest mountain in the world is Mount Everest.',
        questionAnswer: true),
    Question(
        question: 'California is home to the “Desert of Death.',
        questionAnswer: false),
    Question(
        question:
            '13,171 miles is how far the Great Wall of China stretches in total.',
        questionAnswer: false),
    Question(
        question:
            'The Mississippi and the Nile are the two longest rivers in the world.',
        questionAnswer: false),
    Question(
        question: 'The 31.5-mile-long Chunnel connects England and France.',
        questionAnswer: true),
    Question(
        question: 'The world’s largest island is Greenland.',
        questionAnswer: true),
    Question(
        question: 'South America has more nations than Africa has.',
        questionAnswer: false),
    Question(
        question:
            'Of all the states in the union, Alaska has the most active volcanoes.',
        questionAnswer: true),
    Question(
        question: 'The world’s longest coastline is in China. ',
        questionAnswer: false),
  ];

  String getQuestion() {
    return _questionsBank[_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _questionsBank[_questionNumber].questionAnswer;
  }

  void nextQuestion({
    required BuildContext context,
    required String message,
    required Function() onClick
  }) {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return MyCustomAlertDialog(
              title: 'Quizzler',
              message: message,
              onOkBtnClick: onClick);
        },
      );
      resetQuestions();
    }
  }

  void resetQuestions() {
    _questionNumber = 0;
    getQuestion();
  }

  int getTotalQuestions(){
    return _questionsBank.length;
  }

}
