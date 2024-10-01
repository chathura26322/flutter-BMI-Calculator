import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;
  String gender = "";
  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    
                    setState(() {
                      gender = "M";
                    });
                  },
                  child: Container(
                    width: 175,
                    decoration: BoxDecoration(
                      color: gender=="M"? Colors.orange.withAlpha(150):Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    
                    setState(() {
                      gender = "F";
                    });
                  },
                  child: Container(
                    width: 175,
                    decoration: BoxDecoration(
                      color:gender=="F"? Colors.pink.withAlpha(150):Colors.pink.withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Column(
                      children: [
                        Icon(Icons.female, size: 150),
                        Text("Female"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height"),
                      Text(
                        "$height",
                        style: kInputLableColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              )),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight"),
                      Text(
                        "$weight",
                        style: kInputLableColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 30) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              )),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 300) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                const Text("BMI"),
                Text(bmi.toStringAsFixed(2),
                    style: kInputLableColor.copyWith(
                        color: kOutputTextColor, fontSize: 60)),
                Text(
                  getReuslt(bmi),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

double calculateBMI({required int height, required int weight}) {
  return (weight / (height * height) * 10000);
}

String getReuslt(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi < 24.9) {
    return "Normal";
  } else if (bmi < 29.9) {
    return "Overweight";
  } else {
    return "Obese";
  }
}
