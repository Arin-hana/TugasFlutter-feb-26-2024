import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './landingPage.dart';
import './theme.dart';

void main() {
  runApp(const Mbanking());
}

class Mbanking extends StatelessWidget {
  const Mbanking({super.key});

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
        home: const Landing());
  }
}
