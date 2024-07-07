import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe_flutter/Model/board.dart';
import 'package:tic_tac_toe_flutter/Pages/HomePage.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  late List<bool> lst;
  int gridSize = 3;
  int clicks = 0;
  

  @override
  void initState() {
    super.initState();
    lst = List<bool>.filled(gridSize * gridSize, false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Center(
          child: Text(
            'T I C   T A C   T O E',
            style: GoogleFonts.ubuntu(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Homepage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.purple[400],
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          color: Colors.purple[200],
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemCount: gridSize * gridSize,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
