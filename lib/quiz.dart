import 'package:flutter/material.dart';
import 'package:challenge_1/start_screen.dart';
import 'package:challenge_1/questions_screen.dart';
import 'package:challenge_1/data/questions.dart';
import 'package:challenge_1/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   // activeScreen = 'questions-screen'; //StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(
      () {
        // selectedAnswers = [];
        activeScreen = 'questions-screen'; //const QuestionsScreen();
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child:
              screenWidget, //if else statement using ternary operator //activeScreen,
        ),
      ),
    );
  }
}
