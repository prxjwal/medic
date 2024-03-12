import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.bell,
              size: 24,
            ),
          ),
        ],
        title: const Text(
          style: TextStyle(fontFamily: "Poppins-Bold"),
          'My Cancer Risk Assessment',
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
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
                  Padding(
                    padding: EdgeInsets.only(top: 13),
                    child: Text('Complete the questionnaire at your own pace',
                        style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16,
                        )),
                  ),
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
                                fontFamily: "Poppins-Regular",
                                fontWeight: FontWeight.w300,
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
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text(
                      style: const TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                      "${questionController.currentQuestion.value}/37 questions answered"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 16, top: 13, end: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "1.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Poppins-Medium",
                                fontWeight: FontWeight.w600),
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
                                    fontFamily: "Poppins-Medium",
                                    fontWeight: FontWeight.w600,
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
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 37, start: 16, end: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(122, 139, 164, 0.18),
                          minimumSize: const Size(358, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {},
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins-Medium",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 16, end: 16, top: 8, bottom: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(122, 139, 164, 0.18),
                          minimumSize: const Size(358, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {},
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "No",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins-Medium",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 247),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(end: 18, start: 17),
                    child: Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromRGBO(122, 139, 164, 0.75),
                          backgroundColor: Colors.white, // text color

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                              color: Color.fromRGBO(122, 139, 164, 0.75),
                              fontFamily: "Poppins-Medium",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16),
                    child: Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(122, 139, 164, 0.75),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(190, 48),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
