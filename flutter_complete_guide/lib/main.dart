import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/*void main()
{
  runApp(MyApp());
}*/

void main() =>
    runApp(MyApp()); //can be used since there is only one line of code

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //---underscore added to change to private(can only be accessed in this file)
  final _questions = const [
    {
      'questionText': 'What\'s the capital of Canada?',
      'answer': [
        {'text': 'Calgary', 'score': 0},
        {'text': 'Ottawa', 'score': 1},
        {'text': 'Oslo', 'score': 0},
        {'text': 'Alaska', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the capital of Qatar?',
      'answer': [
        {'text': 'Doha', 'score': 1},
        {'text': 'Riyadh', 'score': 0},
        {'text': 'Cairo', 'score': 0},
        {'text': 'Ankara', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the capital of Germany?',
      'answer': [
        {'text': 'Lisbon', 'score': 0},
        {'text': 'Paris', 'score': 0},
        {'text': 'Berlin', 'score': 1},
        {'text': 'Copenhagen', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;  
    });
    
  }

  void _answerQuestion(int score) {
    
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(home: Text('Hey!!'),);   ---most basic with no customisation
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        //body: Text('This is my default text!!'),  ---no customisation
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
