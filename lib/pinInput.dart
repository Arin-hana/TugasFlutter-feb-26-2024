import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

void main() => runApp(PinPutTest());

class PinPutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          hintColor: Colors.green,
        ),
        home: Scaffold(
            body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Pinput(),
            ),
          ),
        )));
  }
}
