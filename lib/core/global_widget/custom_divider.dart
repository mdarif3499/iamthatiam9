import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.width, this.color});
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.textBlack,
      thickness: width ?? 1,
    );
  }
}
