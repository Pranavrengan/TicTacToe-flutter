class Player {
  int wins = 0;
  int loss = 0;
  int tie = 0;

  int get getWins => wins;

  int get getTie => tie;

  int get getloss => loss;

  void addWins() => wins++;
  void addLoss() => loss++;
  void addTie() => tie++;
}
