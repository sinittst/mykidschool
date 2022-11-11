import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mykidsschoolapp/app/global/App_Color.dart';
import 'package:mykidsschoolapp/app/global/App_Icons.dart';
import 'package:mykidsschoolapp/app/routes/app_pages.dart';

import '../controllers/loading_screen_controller.dart';

class LoadingScreenView extends StatefulWidget {
  const LoadingScreenView({Key? key}) : super(key: key);

  @override
  State<LoadingScreenView> createState() => _LoadingScreenViewState();
}

class _LoadingScreenViewState extends State<LoadingScreenView> {
  List<String> loadingPics = [
    AppIcons.appLoading1,
    AppIcons.appLoading2,
    AppIcons.appLoading3,
    AppIcons.appLoading4,
    AppIcons.appLoading5,
    AppIcons.appLoading6,
  ];
  String photo = AppIcons.appLoading1;

  late Timer timer;
  int pos = 6;
  final random = Random();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
    Future.delayed(const Duration(milliseconds: 8000), () {
      nextPage();
    });
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (pos == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            pos--;
            photo = loadingPics[5 - pos];
            debugPrint('Select picture $photo in index ${5 - pos}');
          });
        }
      },
    );
  }
  void nextPage(){
    Get.offAllNamed(Routes.LOGIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return pos != 0
        ? Scaffold(
            backgroundColor: AppColors.appThemeColor,
            body: Center(child: SvgPicture.asset(photo)),
          )
        : Scaffold(
            backgroundColor: AppColors.appThemeColor,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  SvgPicture.asset(photo),
                  const Image(
                    image: AssetImage(
                      AppIcons.appLearningPng,
                    ),
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
          );
  }
}
