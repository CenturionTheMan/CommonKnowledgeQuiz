import 'package:ckq_flutter/Utils/app_colors.dart';
import 'package:ckq_flutter/Utils/quiz_question.dart';
import 'package:ckq_flutter/pages/game_result.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
  late int _timePerQuestionMs;
  Timer? _timer;
  late int _timeLeft;

  @override
  void initState() {
    _timePerQuestionMs = widget.timePerQuestion * 10;
    _questions = QuizQuestion.getRandomQuestionsSubset(widget.questionsAmount);
    resetTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetTimer() {
    _timer?.cancel();
    _timeLeft = _timePerQuestionMs;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer!.cancel();
        setNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: questionNumber()),
              questionText(),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(AppColors.white),
                      backgroundColor: Colors.grey,
                      value: _timeLeft / _timePerQuestionMs,
                    ),
                  ),
                  for (int index = 0;
                      index < _questions[_currentQuestionIndex].answers.length;
                      index++)
                    answerButton(index, context),
                  const SizedBox(height: 10)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container questionText() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text(
        textAlign: TextAlign.center,
        _questions[_currentQuestionIndex].text,
        style: const TextStyle(fontSize: 25, color: AppColors.white),
      ),
    );
  }

  Container questionNumber() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text(
        'Pytanie ${_currentQuestionIndex + 1}/${widget.questionsAmount}',
        style: const TextStyle(fontSize: 35, color: AppColors.white),
      ),
    );
  }

  void setNextQuestion() {
    if (_currentQuestionIndex + 1 < widget.questionsAmount) {
      setState(() {
        _currentQuestionIndex++;
        resetTimer();
      });
    } else {
      _timer?.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameResult(
            correctAmount: _correctAnswers,
            questionAmount: widget.questionsAmount,
          ),
        ),
      );
    }
  }

  Container answerButton(int index, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 10),
      child: ElevatedButton(
        onPressed: () {
          if (index == _questions[_currentQuestionIndex].correctIndex) {
            _correctAnswers++;
          }
          setNextQuestion();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          foregroundColor: AppColors.white,
        ),
        child: Text(
          _questions[_currentQuestionIndex].answers[index],
          style: const TextStyle(fontSize: 20, color: AppColors.white),
        ),
      ),
    );
  }
}
