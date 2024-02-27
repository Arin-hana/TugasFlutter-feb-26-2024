import 'package:flutter/material.dart';
import 'dart:math';
import './theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light().copyWith(
              primary: ColorMain.customPrimary,
              outline: ColorMain.natural7,
              error: ColorMain.customDanger),
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          appBarTheme: const AppBarTheme(surfaceTintColor: ColorMain.natural6),
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 100,
          transform: Matrix4.translationValues(-10, 0, 0),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset('materials/textures/logo_title.png')),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: -pi / 2,
                child: const Icon(Icons.flip),
              ))
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
