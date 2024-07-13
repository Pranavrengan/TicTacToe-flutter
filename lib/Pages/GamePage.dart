// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe_flutter/Model/board.dart';
import 'package:tic_tac_toe_flutter/Pages/HomePage.dart';
import 'package:tic_tac_toe_flutter/Pages/RestartPage.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  late List<bool> lst;
  int gridSize = 3;
  GameBoard gameBoard = GameBoard();
  int currentPlayer = 1;

  @override
  void initState() {
    super.initState();
    gameBoard.initializeBoard(boardSize: gridSize);
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
                child: const Homepage(),
              ),
            );
          },
          child: const Icon(
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
                  onTap: () {
                    if (!lst[index] && !gameBoard.gameOver) {
                      setState(() {
                        if (gameBoard.placingElement(currentPlayer, index)) {
                          lst[index] = true;
                          currentPlayer = (currentPlayer == 1) ? 2 : 1;
                        }
                      });
                      if (gameBoard.gameOver) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: RestartPage(winner: GameBoard.winner),
                          ),
                        );
                      }
                      else if (!lst.contains(false)) {
                         Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const RestartPage(winner: 0),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                          gameBoard.board[index] == 0
                              ? ""
                              : gameBoard.board[index] == 1
                                  ? "X"
                                  : "O",
                          style: GoogleFonts.poppins(
                            color: gameBoard.board[index] == 1
                                ? Colors.red
                                : Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),),
                    ),
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
