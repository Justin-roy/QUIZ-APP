import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:flutter/cupertino.dart';

Question_Bank question_bank = Question_Bank();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreHolder = [];
  int stoper = 0;
  int collectScore = 0;
  int holder = question_bank.length_of_quiz();
  void check_Ans(bool ans) {
    setState(() {
      stoper++;
      bool checker = question_bank.getQuestinAns();
      if (ans == checker) {
        collectScore++;
        scoreHolder.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreHolder.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      question_bank.generator();
    });
  }

  void resetQNA() {
    setState(() {
      showDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text('Play Again'),
              content: Text('Your Final Score $collectScore'),
              actions: [
                CupertinoButton(
                    child: Icon(
                      Icons.refresh,
                    ),
                    onPressed: () {
                      collectScore = 0;
                      Navigator.of(ctx).pop();
                    }),
              ],
            );
          });
    });
    scoreHolder.clear();
    stoper = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                question_bank.getQuestiontxt(),
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                check_Ans(true);
                if (stoper == holder) resetQNA();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                check_Ans(false);
                if (stoper == holder) resetQNA();
              },
            ),
          ),
        ),
        Row(
          children: scoreHolder,
        )
      ],
    );
  }
}
