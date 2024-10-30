import 'package:ckq_flutter/Utils/app_colors.dart';
import 'package:ckq_flutter/pages/home.dart';
import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  const GameResult(
      {super.key, required this.correctAmount, required this.questionAmount});
  final int correctAmount;
  final int questionAmount;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage())),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blue,
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        correctAnswCountText(),
                        const Spacer(flex: 1),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Naciśnij żeby kontynuować...',
                            style:
                                TextStyle(fontSize: 15, color: AppColors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Padding correctAnswCountText() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Twój wynik to: $correctAmount/$questionAmount',
        style: const TextStyle(fontSize: 35, color: AppColors.white),
      ),
    );
  }
}
