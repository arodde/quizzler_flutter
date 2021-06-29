import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizzBrain.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> _scoreKeeper = [];

  void useAlert() {
    // Alert(
    //   context: context,
    //   title: "Finish!!!",
    //   desc: 'You\'ve reached the end of the quiz.',
    // ).show();
    // print(
    //     '============> current ${quizzBrain.questionNumber} bank (${quizzBrain.getLength()}-1)');
    // quizzBrain.alertEffect();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer =
        quizzBrain.currentAnswer(); // quizzBrain.getQuestionAnswer();
    setState(() {
      print('$correctAnswer  $userPickedAnswer');
      if (quizzBrain.isFinished() == true) {
        // useAlert();
        Alert(
          context: context,
          title: "Finish!!!",
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        print(
            '============> current ${quizzBrain.questionNumber} bank (${quizzBrain.getLength()}-1)');
        alertEffect();
      } else {
        if (userPickedAnswer == correctAnswer) {
          _scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          _scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizzBrain.nextQuestion();
      }
    });
  }

  void alertEffect() {
    print('${quizzBrain.questionNumber} ${quizzBrain.getLength() - 1} ');
    quizzBrain.questionNumber = 0;
    _scoreKeeper = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.currentQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: _scoreKeeper,
        )
      ],
    );
  }
}
