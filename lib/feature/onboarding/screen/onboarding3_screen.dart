import 'package:flutter/material.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/app_sizes.dart';
import '../../../core/const/icons_path.dart';
import '../../../core/global_widget/custom_text.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment(0, -1.0),
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.640,
                child: Image.asset(
                  IconsPath.onboarding3,
                  fit: BoxFit.cover, // full screen fit
                ),
              ),
            ),
          ),



          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 88),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Connect & Grow",

                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textC1204,
                  ),

                  SizedBox(height: 12),

                  CustomText(
                    textAlign: TextAlign.center,
                    text:
                    "Discover new brands, build trust, and grow together.",

                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C1204),
                  ),

                  SizedBox(height: getHeight(228)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
