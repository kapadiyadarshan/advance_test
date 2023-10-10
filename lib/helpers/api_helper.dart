import 'dart:convert';

import 'package:exam1_app/modal/exercise_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String Api = "https://api.api-ninjas.com/v1/exercises";

  getData({required String muscle, required String difficulty}) async {
    http.Response response = await http.get(
        Uri.parse("${Api}?muscle=$muscle&difficulty=$difficulty"),
        headers: {
          'X-Api-Key': '+ZGdgIYHymcuBBV2hjQt2Q==VX9UnL1txHbKpI0S',
        });

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      List<ExcerciseModal> allExcercise = data
          .map(
            (e) => ExcerciseModal.fromMap(
              data: e,
            ),
          )
          .toList();
      return allExcercise;
    } else {
      return null;
    }
  }
}
