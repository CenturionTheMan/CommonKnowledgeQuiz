import 'package:ckq_flutter/pages/home.dart';
import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  const GameResult(
      {super.key, required this.correctAmount, required this.questionAmount});
  final int correctAmount;
  final int questionAmount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Poprawne odpowiedzi: ${correctAmount}/${questionAmount}',
              style: const TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Naciśnij gdziekolwiek żeby kontynować...',
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
