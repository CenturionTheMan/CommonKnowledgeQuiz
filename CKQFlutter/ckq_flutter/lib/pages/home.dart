import 'package:ckq_flutter/Utils/app_colors.dart';
import 'package:ckq_flutter/Utils/quiz_question.dart';
import 'package:ckq_flutter/pages/in_game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controllerQuestionAmount;
  late TextEditingController _controllerTimePerQuestion;
  late int _questionAmount;
  int _timePerQuestion = 10;

  @override
  void initState() {
    super.initState();
    _questionAmount = (QuizQuestion.getQuestionAmount() / 2).round();

    _controllerQuestionAmount = TextEditingController();
    _controllerQuestionAmount.text = _questionAmount.toString();
    _controllerQuestionAmount.addListener(() {
      String newText = _controllerQuestionAmount.text;
      if (newText == _questionAmount.toString()) {
        return;
      }
      int? num = int.tryParse(newText);
      if (newText.isEmpty) {
        setState(() {
          _controllerQuestionAmount.text = "1";
        });
        return;
      }
      if (num == null) {
        setState(() {
          _controllerQuestionAmount.text = _questionAmount.toString();
        });
        return;
      }
      if (num < 1) {
        setState(() {
          _controllerQuestionAmount.text = "1";
        });
        return;
      }
      if (num > QuizQuestion.getQuestionAmount()) {
        setState(() {
          _controllerQuestionAmount.text =
              QuizQuestion.getQuestionAmount().toString();
        });
        return;
      }
      _questionAmount = int.parse(_controllerQuestionAmount.text);
    });

    _controllerTimePerQuestion = TextEditingController();
    _controllerTimePerQuestion.text = _timePerQuestion.toString();
    _controllerTimePerQuestion.addListener(() {
      String newText = _controllerTimePerQuestion.text;
      if (newText == _timePerQuestion.toString()) {
        return;
      }
      int? num = int.tryParse(newText);
      if (newText.isEmpty) {
        setState(() {
          _controllerTimePerQuestion.text = "1";
        });
        return;
      }
      if (num == null) {
        setState(() {
          _controllerTimePerQuestion.text = _timePerQuestion.toString();
        });
        return;
      }
      if (num < 1) {
        setState(() {
          _controllerTimePerQuestion.text = "1";
        });
        return;
      }

      _timePerQuestion = int.parse(_controllerTimePerQuestion.text);
    });
  }

  @override
  void dispose() {
    _controllerQuestionAmount.dispose();
    _controllerTimePerQuestion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: AppColors.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [topText(), inputValues(), startButton(context)],
          )),
    );
  }

  Container startButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (conext) => InGame(
                      questionsAmount: _questionAmount,
                      timePerQuestion: _timePerQuestion)));
        },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            textStyle: const TextStyle(fontSize: 30),
            backgroundColor: AppColors.darkBlue,
            foregroundColor: AppColors.white),
        child: const Text("ROZPOCZNIJ"),
      ),
    );
  }

  Container inputValues() {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 220,
                  child: Text(
                    "Ilość pytań w rozgrywce: ",
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ),
                Flexible(
                    child: TextField(
                  style: const TextStyle(color: AppColors.white, fontSize: 20),
                  controller: _controllerQuestionAmount,
                  cursorWidth: BorderSide.strokeAlignCenter,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white)),
                  ),
                ))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 220,
                  child: Text(
                    "Czas na pytanie: ",
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ),
                Flexible(
                    child: TextField(
                        controller: _controllerTimePerQuestion,
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 20),
                        cursorWidth: BorderSide.strokeAlignCenter,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.white)))))
              ],
            ),
          ],
        ));
  }

  Container topText() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Text(
        "Quiz wiedzy ogólnej",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 48, color: AppColors.white),
      ),
    );
  }
}
