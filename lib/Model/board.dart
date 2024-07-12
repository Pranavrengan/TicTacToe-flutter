import 'dart:io';

// import 'dart:ui';

class GameBoard {
  bool gameOver = false;
  late int _boardSize;
  late List<int> board;

  //Initializing tic tac toe board with dynamic _boardsize

  void initializeBoard({int boardSize = 3}) {
    _boardSize = boardSize;
    board = List.filled(_boardSize * _boardSize, 0);
    // _displayBoard();
  }

  // //Displaying tic tac toe board in terminal
  // void _displayBoard() {
  //   for (var i = 0; i < _boardSize * _boardSize; i += _boardSize) {
  //     for (var j = 0; j < _boardSize; j++) {
  //       stdout.write(
  //           '| ${i + j} | ${board[i + j]}  '); //we can't use stdout in flutter
  //     }
  //     print('\n ${'---------' * _boardSize}');
  //   }
  // }

  //placing element in tic tac toe board
  bool placingElement(int player, int position) {
    if (position < _boardSize * _boardSize && !gameOver) {
      if (board[position] == 0) {
        board[position] = player;
        checkCondition(player);
        return true;
      } else {
        print('Position $position is already taken.');
        return false;
      }
    } else {
      if (!gameOver) {
        print('Invalid position $position. It must be between 0 and ${_boardSize * _boardSize - 1}.');
      } else {
        print('Game is already over. Restart the game to play again.');
      }
      return false;
    }
  }

void checkCondition(int currentPlayer) {
  int playerX = 0;
  int playerO = 0;
  print('Checking condition for player $currentPlayer');

  // Horizontal check
  for (var i = 0; i < _boardSize * _boardSize; i += _boardSize) {
    playerO = playerX = 0;
    for (var j = 0; j < _boardSize; j++) {
      if (board[i + j] == 1) {
        playerX += 1;
      }
      if (board[i + j] == 2) {
        playerO += 1;
      }
      if (playerX == _boardSize || playerO == _boardSize) {
        gameOver = true;
        return;
      }
    }
  }

  playerX = playerO = 0;
  // Vertical check
  for (var i = 0; i < _boardSize; i++) {
    playerO = playerX = 0;
    for (var j = 0; j < _boardSize * _boardSize; j += _boardSize) {
      if (board[i + j] == 1) {
        playerX += 1;
      }
      if (board[i + j] == 2) {
        playerO += 1;
      }
      if (playerX == _boardSize || playerO == _boardSize) {
        gameOver = true;
        print('Vertical $currentPlayer is the winner');
        return;
      }
    }
  }

  playerO = playerX = 0;
  // Left diagonal check
  for (int i = 0; i < _boardSize * _boardSize; i += (_boardSize + 1)) {
    if (board[i] == 1) {
      playerX += 1;
    }
    if (board[i] == 2) {
      playerO += 1;
    }
    if (playerX == _boardSize || playerO == _boardSize) {
      gameOver = true;
      print('Left diagonal $currentPlayer is the winner');
      return;
    }
  }

  playerO = playerX = 0;
  // Right diagonal check
  for (int i = _boardSize - 1; i < (_boardSize * _boardSize - 1); i += (_boardSize - 1)) {
    if (board[i] == 1) {
      playerX += 1;
    }
    if (board[i] == 2) {
      playerO += 1;
    }
    if (playerX == _boardSize || playerO == _boardSize) {
      gameOver = true;
      print('Right diagonal $currentPlayer is the winner');
      return;
    }
  }
}

}

