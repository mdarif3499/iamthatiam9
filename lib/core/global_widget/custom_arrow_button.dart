import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {

        Get.back();

      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
