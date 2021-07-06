import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'Your score is ' + resultScore.toString() + '\n';
    if (resultScore == 1) {
      resultText += 'You suck!!';
    } else if (resultScore == 2) {
      resultText += 'Not bad...';
    } else if (resultScore == 3) {
      resultText += 'You\'re awesome!!!';
    } else {
      resultText += 'Could you BE more DUMBER...??';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
            textColor: Colors.black,
            color: Colors.blue[300],
          )
        ],
      ),
    );
  }
}
