import 'package:exam1_app/controller/excercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/exercise_modal.dart';
import '../../utils/color_utils.dart';

class ExcercisePage extends StatelessWidget {
  const ExcercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Excercises",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColor.theme1,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ExcerciseController>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: (provider.allExcercise.isEmpty)
              ? Center(
                  child: Image.asset(
                    "asset/images/no_data.png",
                    scale: 5,
                  ),
                )
              : ListView.builder(
                  itemCount: provider.allExcercise.length,
                  itemBuilder: (context, index) {
                    ExcerciseModal temp = provider.allExcercise[index];

                    return Card(
                      color: MyColor.theme1,
                      child: ListTile(
                        title: Text(
                          temp.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Type: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(text: temp.type),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Equipment: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(text: temp.equipment),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Muscle: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(text: temp.muscle),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Difficulty: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(text: temp.difficulty),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Instruction: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(text: temp.instructions),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }
}
