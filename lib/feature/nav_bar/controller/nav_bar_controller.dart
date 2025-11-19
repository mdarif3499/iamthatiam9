import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/app_sizes.dart';
import '../../../core/const/icons_path.dart';
import '../../../main.dart';



class NavBarController extends GetxController {
  final selectedIndex = 0.obs;

  int get currentIndex => selectedIndex.value;

  void changeIndex(int index) {
    if (index >= 0 && index < screens.length) {
      selectedIndex.value = index;
    }
  }

  final List<Widget> screens = [
    NotGetCertificateScreen(),
    NotGetCertificateScreen(),
    NotGetCertificateScreen(),
    NotGetCertificateScreen(),

  ];

  final List<String> labels = const [
    '1',
    '2',
    '3',
    "4",
  ];

  final List<Image> activeIcons = [
    Image.asset(
      IconsPath.test,
      height: getHeight(24),
      width: getWidth(35), color: AppColors.primaryColor,), Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(40)), Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(28)), Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(40)),];
  final List<Image> inActiveIcons = [
    Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(24)),
    Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(32)),
    Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(28)),
    Image.asset(IconsPath.test, height: getHeight(35), width: getWidth(40)),


  ];
}
