import 'package:flutter/material.dart';
import 'package:quizs/data/questions.dart';
import 'package:quizs/questions_screen.dart';
import 'package:quizs/results_screen.dart';
import 'package:quizs/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void swichScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void onRestart(){
    setState(() {
      selectedAnswers=[];
      activeScreen='questions-screen';
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(swichScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: choosenAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart : onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 18, 168)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
