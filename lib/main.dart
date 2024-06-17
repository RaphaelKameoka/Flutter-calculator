import 'package:calculator/widgets/calculator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var kColorScheme =ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 59, 181, 167));

void main (){
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
    ),
    home: CalculatorScreen(),
  ));
}