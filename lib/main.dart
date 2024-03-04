import 'package:flutter/material.dart';
import 'package:flutter_application_11/pages/home.dart';

void main() {
  runApp(const BMIPlus());
}

class BMIPlus extends StatelessWidget {
  const BMIPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
