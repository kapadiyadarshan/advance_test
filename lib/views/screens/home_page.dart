import 'package:exam1_app/controller/excercise_controller.dart';
import 'package:exam1_app/helpers/api_helper.dart';
import 'package:exam1_app/modal/exercise_modal.dart';
import 'package:exam1_app/utils/color_utils.dart';
import 'package:exam1_app/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Muscle",
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
          return GridView.builder(
            itemCount: provider.Muscles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MyRoute.defficultyPage,
                    arguments: provider.Muscles[index],
                  );
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  // margin: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(12),
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
                      Container(
                        height: 140,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "asset/images/${provider.Muscles[index]}.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        provider.Muscles[index],
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          );
        }),
      ),
    );
  }
}
