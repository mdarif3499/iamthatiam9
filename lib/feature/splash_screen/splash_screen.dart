import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iamthatiam9/core/const/app_colors.dart';
import 'package:iamthatiam9/core/global_widget/custom_text.dart';

import '../../core/const/app_sizes.dart';
import '../../core/const/icons_path.dart';
import '../onboarding/screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    /// 3 seconds delay, then go to OnboardingScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Center SVG Icon + Circular Loader
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// SVG Icon
                  SvgPicture.asset(
                    IconsPath.splash,
                    width: getWidth(120),
                    height: getHeight(120),
                  ),

                  SizedBox(height: getHeight(24)),

                  /// 🔵 Circular Loader (SpinKitCircle)






                ],
              ),
            ),






            Positioned(
              bottom: 160,
              left: 0,
              right: 0,
              child:     SpinKitCircle(
                color: AppColors.primaryColor2,
                size: getWidth(55),
                controller: _controller,
              ),


            ),

            /// Bottom Terms / Privacy / Contact
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Terms",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                  SizedBox(width: getWidth(4)),
                  _dot(),
                  SizedBox(width: getWidth(4)),
                  CustomText(
                    text: "Privacy",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                  SizedBox(width: getWidth(4)),
                  _dot(),
                  SizedBox(width: getWidth(4)),
                  CustomText(
                    text: "Contact",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Small round dot separator
  Widget _dot() {
    return Container(
      margin: const EdgeInsets.only(top: 1),
      height: getHeight(4),
      width: getWidth(4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
