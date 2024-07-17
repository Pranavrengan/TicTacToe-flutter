

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe_flutter/Pages/GamePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(border: Border.all(color: Colors.white24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Gamepage(

                  //     ),
                  //   ),
                  // );
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Gamepage()));
                },
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.purple[300],
                  child: Center(
                    child: Text(
                      'S T A R T    G A M E',
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
                onTap: () {}, // call this to exit app
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.purple[300],
                  child: Center(
                    child: Text(
                      'Q U I T    G A M E',
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


