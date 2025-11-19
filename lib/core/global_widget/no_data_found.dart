import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../const/app_sizes.dart';
import '../const/icons_path.dart';
import 'custom_text.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
    this.message,
    this.imgeHeight,
    this.gap1,
    this.gap2,
    this.gap3,
  });
  final String? message;
  final double? imgeHeight, gap1, gap2, gap3;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.scaffoldBgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: gap1),
          Image.asset(IconsPath.home, height: imgeHeight ?? 100),
          SizedBox(height: gap2 ?? getHeight(100)),
          CustomText(
            text: "Oops!",
            fontSize: getWidth(32),
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: gap3 ?? getHeight(9)),
          CustomText(
            text: message ?? "No data found",
            fontSize: getWidth(16),
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
