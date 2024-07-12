import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/Pages/GamePage.dart';
// import 'package:tic_tac_toe_flutter/Pages/HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    
      home: Gamepage(),
    );
  }
}


