import 'dart:async';

import 'package:get/get.dart';

class LoadingScreenController extends GetxController {
  //TODO: Implement LoadingScreenController

  late Timer timer;
  RxInt start = 6.obs;

  final count = 0.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    print("timer start");
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          print(start);
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
