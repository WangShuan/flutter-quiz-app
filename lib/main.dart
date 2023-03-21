import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = const [
      {
        'questionText': '你最喜歡的顏色是什麼？',
        'answers': [
          {'text': '黑色', 'score': 10},
          {'text': '白色', 'score': 0},
          {'text': '紅色', 'score': 5}
        ],
      },
      {
        'questionText': '你最喜歡的動物是什麼？',
        'answers': [
          {'text': '水母', 'score': 5},
          {'text': '毒蠍子', 'score': 10},
          {'text': '水豚', 'score': 0}
        ],
      },
      {
        'questionText': '你最喜歡的詞彙是什麼？',
        'answers': [
          {'text': '天使', 'score': 0},
          {'text': '平凡', 'score': 5},
          {'text': '惡魔', 'score': 10},
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('超級簡易小測驗'),
          backgroundColor: Colors.pink[200],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
