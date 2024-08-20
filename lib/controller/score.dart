import 'package:flutter/material.dart';

class ScoreDate {
  final int score;
  final DateTime date;

  ScoreDate({required this.score, required this.date});
}

class TotalScore extends ChangeNotifier {
  int score = 0;
  String text = '';
  List<ScoreDate> scoresList = [];

  void addScoreToList(ScoreDate scoreToAdd) {
    scoresList.add(scoreToAdd);
    notifyListeners();
  }

// Update usage in updateScore
  updateScore(int num) {
    score = num;

    addScoreToList(ScoreDate(score: score, date: DateTime.now()));
    notifyListeners();
  }

  void removeScoreList() {
    scoresList.clear();
    notifyListeners();
  }
}
