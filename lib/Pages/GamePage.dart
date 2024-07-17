// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tic_tac_toe_flutter/Model/board.dart';
import 'package:tic_tac_toe_flutter/Model/player.dart';
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
  Player player1 = Player();
  Player player2 = Player();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Player 1 profile
          GestureDetector(
            onTap: () {
              // showPopover(context: context, bodyBuilder: (context) => ListItems());
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('W I N S'),
                              Text(player1.getWins.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('L O S E'),
                              Text(player1.getloss.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('T I E'),
                              Text(player1.getTie.toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  child: Container(
                    height: 80,
                    width: 250,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Image.asset(
                            'lib/assets/profile.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'P L A Y E R   1',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //Game Board
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: 350,
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
                              if (gameBoard.placingElement(
                                  currentPlayer, index)) {
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
                            } else if (!lst.contains(false)) {
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
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          //Player 2 profile

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                             borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),
                child: Container(
                  height: 80,
                  width: 250,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'P L A Y E R   2',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                        child: Image.asset(
                          'lib/assets/profile.png',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
