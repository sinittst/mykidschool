import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mykidsschoolapp/app/global/App_Icons.dart';

import '../../../global/App_Color.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appThemeColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            SvgPicture.asset(AppIcons.appLoading1),
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
