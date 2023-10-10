import 'package:exam1_app/helpers/api_helper.dart';
import 'package:flutter/material.dart';

import '../modal/exercise_modal.dart';

class ExcerciseController extends ChangeNotifier {
  List<ExcerciseModal> allExcercise = [];

  List<String> Muscles = [
    "abdominals",
    "calves",
    "biceps",
    "adductors",
    "chest",
    "forearms",
    "glutes",
    "hamstrings",
    "lats",
    "lower_back",
    "middle_back",
    "neck",
    "traps",
    "triceps",
  ];

  List<String> Difficulty = [
    "beginner",
    "intermediate",
    "expert",
  ];

  ExcerciseController() {
    getExcerciseData(muscle: "biceps", difficulty: "expert");
  }

  Future<List<ExcerciseModal>?> getExcerciseData(
      {required String muscle, required String difficulty}) async {
    allExcercise = await ApiHelper.apiHelper
            .getData(muscle: muscle, difficulty: difficulty) ??
        [];
    notifyListeners();
  }
}
