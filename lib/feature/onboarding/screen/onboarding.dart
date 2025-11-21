import 'package:flutter/material.dart';
import 'package:iamthatiam9/core/const/app_colors.dart';
import 'package:iamthatiam9/core/const/app_sizes.dart';
import 'package:iamthatiam9/core/global_widget/custom_submit_button.dart';
import 'package:iamthatiam9/core/route/route.dart';
import 'package:iamthatiam9/feature/onboarding/screen/onboarding2_screen.dart';
import 'package:get/get.dart';
import 'onboarding1_screen.dart';
import 'onboarding3_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Widget> pages = [
    const Onboarding1Screen(),
    const Onboarding2Screen(),
    const Onboarding3Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PAGEVIEW
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),

          Positioned(
            bottom: 338,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.primaryColor
                        : AppColors.grey1D1D1,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),

          /// NEXT BUTTON
          Positioned(
            bottom: 112,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: CustomSubmitButton(
                  height: getHeight(56),
                  radius: 24,
                  text: "Next",
                  onTap: () {
                    if (_currentIndex < pages.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.offAllNamed(AppRoutes.onboardingRoleScreen);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
