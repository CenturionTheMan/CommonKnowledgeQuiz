import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: const Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        "Liczba pytań: ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Flexible(
                        child: TextField(
                            cursorWidth: BorderSide.strokeAlignCenter,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Wpisz liczbe")))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        "Czas na pytanie: ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Flexible(
                        child: TextField(
                            cursorWidth: BorderSide.strokeAlignCenter,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Wpisz liczbe sekund")))
                  ],
                ),
              ],
            )),
        Container(
          margin: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
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
