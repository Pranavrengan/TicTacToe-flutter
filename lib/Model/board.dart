

class GameBoard {
  bool gameOver = false;
  static int winner = 0;
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
        return false;
      }
    } else {
      if (!gameOver) {
      } else {
      }
      return false;
    }
  }

  void checkCondition(int currentPlayer) {
    int playerX = 0;
    int playerO = 0;

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
          winner = currentPlayer;
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
          winner = currentPlayer;
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
        winner = currentPlayer;
        return;
      }
    }

    playerO = playerX = 0;
    // Right diagonal check
    for (int i = _boardSize - 1;
        i < (_boardSize * _boardSize - 1);
        i += (_boardSize - 1)) {
      if (board[i] == 1) {
        playerX += 1;
      }
      if (board[i] == 2) {
        playerO += 1;
      }
      if (playerX == _boardSize || playerO == _boardSize) {
        gameOver = true;
        winner = currentPlayer;
        return;
      }
    }
  }
}
