import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: AppColors.primaryColor);
  }
}
