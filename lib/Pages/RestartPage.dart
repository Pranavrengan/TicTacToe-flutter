// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe_flutter/Pages/GamePage.dart';
import 'package:tic_tac_toe_flutter/Pages/HomePage.dart';

class RestartPage extends StatelessWidget {
  final int winner;
  const RestartPage({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(winner == 0) ? 'T  I  E' : (winner==1)?' X    I S    T H E   W I N N E R':' O    I S    T H E    W I N N E R'} ' ,
                style: GoogleFonts.ubuntu(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70,),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Gamepage(

                  //     ),
                  //   ),
                  // );
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: const Gamepage()));
                },
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.purple[300],
                  child: Center(
                    child: Text(
                      'R  E  S T A R T    G A M E',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child:  const Homepage()));
                }, // call this to exit app
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.purple[300],
                  child: Center(
                    child: Text(
                      'M  E  N  U',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
