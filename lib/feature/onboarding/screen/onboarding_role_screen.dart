import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iamthatiam9/core/const/icons_path.dart';
import 'package:iamthatiam9/core/global_widget/custom_submit_button.dart';
import 'package:iamthatiam9/core/global_widget/custom_text.dart';
import 'package:iamthatiam9/core/route/route.dart';
import '../../../core/const/app_colors.dart';
import 'package:get/get.dart';
import '../../../core/const/app_sizes.dart';

enum UserRole { buyer, business }

class OnboardingRoleScreen extends StatefulWidget {
  const OnboardingRoleScreen({super.key});

  @override
  State<OnboardingRoleScreen> createState() => _OnboardingRoleScreenState();
}

class _OnboardingRoleScreenState extends State<OnboardingRoleScreen> {
  UserRole _selectedRole = UserRole.buyer;

  Widget _buildRoleCard({
    required String title,
    required UserRole role,
    required IconData icon,
  }) {
    final bool isSelected = _selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF6F1FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Color(0xFFF6F1FF) : const Color(0xFFEBEBEB),
            width: isSelected ? 0 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Color(0xFFF6F1FF),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                IconsPath.buyer,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ),

            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.11),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Choose Your Role',

                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text3124,
                    ),
                    SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text:
                        'Choose how you want to use the app, as a Buyer or as Business',

                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text60,
                      ),
                    ),
                    SizedBox(height: getHeight(30)),

                    _buildRoleCard(
                      title: 'Buyer',
                      role: UserRole.buyer,
                      icon: Icons.shopping_cart_outlined,
                    ),

                    _buildRoleCard(
                      title: 'Business',
                      role: UserRole.business,
                      icon: Icons.storefront_outlined,
                    ),

                    SizedBox(height: getHeight(50)),


                    CustomSubmitButton(text: 'continue', onTap: () {
                      String roleName = _selectedRole == UserRole.buyer
                          ? 'Buyer'
                          : 'Business';

                      Get.toNamed(AppRoutes.signupScreen);
                    },
                      height: getHeight(52),

                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
