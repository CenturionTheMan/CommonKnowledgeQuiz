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
    _controllerQuestionAmount.addListener(() {
      String newText = _controllerQuestionAmount.text;
      if (newText.isEmpty ||
          int.tryParse(newText) == null ||
          int.parse(newText) < 1) {
        setState(() {
          _controllerQuestionAmount.text = _questionAmount.toString();
        });
        return;
      }
      _questionAmount = int.parse(_controllerQuestionAmount.text);
    });

    _controllerTimePerQuestion = TextEditingController();
    _controllerTimePerQuestion.text = _timePerQuestion.toString();
    _controllerTimePerQuestion.addListener(() {
      String newText = _controllerTimePerQuestion.text;
      if (newText.isEmpty ||
          int.tryParse(newText) == null ||
          int.parse(newText) < 1) {
        setState(() {
          _controllerTimePerQuestion.text = _timePerQuestion.toString();
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
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            "Quiz wiedzy ogólnej",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 60),
          ),
        ),
        Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      width: 180,
                      child: Text(
                        "Liczba pytań: ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Flexible(
                        child: TextField(
                            controller: _controllerQuestionAmount,
                            cursorWidth: BorderSide.strokeAlignCenter,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Wpisz liczbe")))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      width: 180,
                      child: Text(
                        "Czas na pytanie: ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Flexible(
                        child: TextField(
                            controller: _controllerTimePerQuestion,
                            cursorWidth: BorderSide.strokeAlignCenter,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Wpisz liczbe sekund")))
                  ],
                ),
              ],
            )),
        Container(
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
                minimumSize: const Size(300, 50),
                maximumSize: const Size(500, 50),
                textStyle: const TextStyle(fontSize: 30)),
            child: const Text("Start"),
          ),
        )
      ],
    ));
  }
}
