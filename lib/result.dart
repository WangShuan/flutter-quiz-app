import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetQuiz;
  Result(this.finalScore, this.resetQuiz);

  String get resultText {
    var ret = 'You did it!';
    if (finalScore <= 5) {
      ret = "看來你的邪惡指數很低，\n可以上天堂！";
    } else if (finalScore <= 20) {
      ret = "殘念，\n你就是個普通人。";
    } else {
      ret = "確認過眼神，\n你就是個超邪惡的人！";
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text(
              'Restart Quiz!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.pink[200]),
            ),
          )
        ],
      ),
    );
  }
}
