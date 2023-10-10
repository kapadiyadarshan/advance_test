import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/excercise_controller.dart';
import '../../utils/color_utils.dart';
import '../../utils/route_utils.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    String muscle = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Difficulty",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColor.theme1,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<ExcerciseController>(builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.Difficulty.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  provider.getExcerciseData(
                    muscle: muscle,
                    difficulty: provider.Difficulty[index],
                  );
                  Navigator.pushNamed(context, MyRoute.excercisePage);
                },
                child: Container(
                  height: 246,
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MyColor.theme1,
                        MyColor.theme2,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/images/${provider.Difficulty[index]}.png",
                        scale: 11,
                      ),
                      Text(
                        provider.Difficulty[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
