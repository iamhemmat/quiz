import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int correct, incorrect;
   const Result({Key key, this.correct, this.incorrect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Correct Questions:$correct"),
            Text("InCorrect Questions:$incorrect"),
          ],
      ),
    );
  }
}
