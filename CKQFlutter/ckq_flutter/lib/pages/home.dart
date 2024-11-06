import 'package:ckq_flutter/Utils/app_colors.dart';
import 'package:ckq_flutter/Utils/custom_numeric_input_formatter.dart';
import 'package:ckq_flutter/Utils/quiz_question.dart';
import 'package:ckq_flutter/pages/in_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controllerQuestionAmount;
  late TextEditingController _controllerTimePerQuestion;

  @override
  void initState() {
    super.initState();

    _controllerQuestionAmount = TextEditingController();
    _controllerQuestionAmount.text =
        (QuizQuestion.getQuestionAmount() / 2).round().toString();

    _controllerTimePerQuestion = TextEditingController();
    _controllerTimePerQuestion.text = "10";
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
          resizeToAvoidBottomInset: false,
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
                  builder: (context) => InGame(
                      questionsAmount: _controllerQuestionAmount.text.isEmpty
                          ? 1
                          : int.parse(_controllerQuestionAmount.text),
                      timePerQuestion: _controllerTimePerQuestion.text.isEmpty
                          ? 1
                          : int.parse(
                              _controllerTimePerQuestion.text.toString()))));
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
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  inputFormatters: [
                    CustomNumericInputFormatter(
                        minValue: 1, maxValue: QuizQuestion.getQuestionAmount())
                  ],
                  style: const TextStyle(color: AppColors.white, fontSize: 20),
                  controller: _controllerQuestionAmount,
                  cursorWidth: BorderSide.strokeAlignCenter,
                  decoration: const InputDecoration(
                    hintText: "wprowadź liczbę",
                    hintStyle: TextStyle(color: AppColors.white),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
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
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        inputFormatters: [
                          CustomNumericInputFormatter(minValue: 1)
                        ],
                        controller: _controllerTimePerQuestion,
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 20),
                        cursorWidth: BorderSide.strokeAlignCenter,
                        decoration: const InputDecoration(
                          hintText: "wprowadź czas",
                          hintStyle: TextStyle(color: AppColors.white),
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                        )))
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
