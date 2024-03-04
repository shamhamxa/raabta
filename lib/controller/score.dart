import 'package:flutter/material.dart';

class TotalScore extends ChangeNotifier {
  int score = 0;
  List<int> scoresList = [];
  void updateScore(int num) {
    score = num;
    notifyListeners();
    addScoreToList(score);
  }

  void addScoreToList(int scoreToAdd) {
    scoresList.add(scoreToAdd);
    notifyListeners();
  }

  void removeScoreList() {
    scoresList.clear();
    notifyListeners();
  }
}
