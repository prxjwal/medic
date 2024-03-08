import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBarWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              child: Text(
                'My Cancer Risk Assessment',
              ),
            ),
            SizedBox(width: 15),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(Icons.notifications),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Complete the questionnaire at your own pace',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
            Obx(() => SfSlider(
                value: questionController.currentQuestion.value
                    .clamp(1, 37)
                    .toDouble(),
                min: 1,
                max: 37,
                interval: 1,
                showTicks: false,
                showLabels: false,
                enableTooltip: true,
                thumbIcon: Stack(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color.fromARGB(255, 220, 125, 87),
                      size: 20,
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Text(
                        ' ${questionController.currentQuestion.value}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                onChanged: (value) {
                  questionController.currentQuestion.value = value.toInt();
                },
                onChangeEnd: (value) {})),
            Text(
                "${questionController.currentQuestion.value}/37 questions answered"),
            Text(" 1. Have you ever been diagnosed with cancer? "),
            Container(
              child: Text("Yes"),
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              child: Text("No"),
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Previous'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuestionController extends GetxController {
  var currentQuestion = 1.obs;
  void nextQuestion() {
    if (currentQuestion.value < 37) {
      currentQuestion.value++;
    }
  }

  void prevQuestion() {
    if (currentQuestion.value > 1) {
      currentQuestion.value--;
    }
  }
}
