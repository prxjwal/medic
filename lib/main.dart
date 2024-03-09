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
    final deviceSize = mediaQuery.size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceSize.width * 0.6, // 60% of device width
              child: const Text(
                'My Cancer Risk Assessment',
              ),
            ),
            SizedBox(width: deviceSize.width * 0.03), // 3% of device width
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: deviceSize.width * 0.01, // 1% of device width
            ),
            const Icon(Icons.notifications),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text('Complete the questionnaire at your own pace',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.all(0),
                  child: SfSlider(
                      activeColor: const Color.fromARGB(255, 220, 125, 87),
                      inactiveColor: const Color.fromARGB(255, 226, 255, 255),
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
                          const Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 220, 125, 87),
                            size: 20,
                          ),
                          Positioned(
                            bottom: 2,
                            right: questionController.currentQuestion.value <= 9
                                ? 5.7
                                : 2,
                            child: Text(
                              ' ${questionController.currentQuestion.value}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onChanged: (value) {
                        questionController.currentQuestion.value =
                            value.toInt();
                      },
                      onChangeEnd: (value) {}),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    "${questionController.currentQuestion.value}/37 questions answered"),
              ],
            ),
            const SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "1.",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  width: mediaQuery.size.width - 100,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Expanded(
                      flex: 1,
                      child: Text(
                        "Have you ever been diagnosed with cancer?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height / 2 - 150,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.white, // text color
                    side: const BorderSide(
                      color: Colors.grey, // border color
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(180, 50),
                  ),
                  child: const Text('Next'),
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
