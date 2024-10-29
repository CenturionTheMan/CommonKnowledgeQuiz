import 'package:ckq_flutter/Utils/quiz_question.dart';
import 'package:ckq_flutter/pages/game_result.dart';
import 'package:flutter/material.dart';

class InGame extends StatefulWidget {
  const InGame(
      {super.key,
      required this.questionsAmount,
      required this.timePerQuestion});
  final int questionsAmount;
  final int timePerQuestion;

  @override
  State<InGame> createState() => _InGameState();
}

class _InGameState extends State<InGame> {
  _InGameState();

  late List<QuizQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  @override
  void initState() {
    _questions = QuizQuestion.getRandomQuestionsSubset(widget.questionsAmount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                'Pytanie ${_currentQuestionIndex + 1} / ${widget.questionsAmount}',
                style: const TextStyle(fontSize: 35),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                textAlign: TextAlign.center,
                _questions[_currentQuestionIndex].text,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Column(
                children: _questions[_currentQuestionIndex]
                    .answers
                    .asMap()
                    .entries
                    .map((entry) {
              int index = entry.key;
              String answer = entry.value;
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 2, 20, 10),
                child: ElevatedButton(
                    onPressed: () {
                      if (index ==
                          _questions[_currentQuestionIndex].correctIndex) {
                        _correctAnswers++;
                      }
                      if (_currentQuestionIndex + 1 < widget.questionsAmount) {
                        setState(() {
                          _currentQuestionIndex++;
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameResult(
                                    correctAmount: _correctAnswers,
                                    questionAmount: widget.questionsAmount)));
                      }
                    },
                    child: Text(answer)),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
