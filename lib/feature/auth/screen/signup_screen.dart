import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iamthatiam9/core/const/icons_path.dart';
import 'package:iamthatiam9/core/const/app_colors.dart';
import 'package:iamthatiam9/core/const/app_sizes.dart';
import 'package:iamthatiam9/core/global_widget/custom_submit_button.dart';
import 'package:iamthatiam9/core/global_widget/custom_text.dart';
import 'package:iamthatiam9/core/global_widget/custom_textfield.dart';
import 'package:iamthatiam9/core/route/route.dart';
import 'package:iamthatiam9/feature/auth/controller/signup_controller.dart';

const Color kPrimaryColor = Color(0xFF8000FF);

const Color kBackgroundColor = Color(
  0xFFF0F0F0,
);

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.put(SignupController());
  bool _obscureText = true;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getHeight(36)),
            SvgPicture.asset(
              IconsPath.reg,
              height: getHeight(64),
              width: getWidth(64),
            ),
            SizedBox(height: getHeight(36)),

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
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Register & Get Started',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text3124,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: "Let's get started with a free account",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text60,
                        ),
                      ),
                      SizedBox(height: getHeight(32)),

                      // Full Name
                      CustomTextfield(
                        controller: controller.nameController,
                        hintext: 'Enter your full name',
                        title: 'Full Name',
                        prefixIcon: Image.asset(
                          IconsPath.profile,
                          height: getHeight(1),
                          width: getWidth(25),
                        ),
                      ),
                      SizedBox(height: getHeight(20)),

                      // Email
                      CustomTextfield(
                        controller: controller.emailController,
                        hintext: 'Enter your email address',
                        title: 'Email Address',
                        prefixIcon: Image.asset(
                          IconsPath.sms,
                          height: getHeight(20),
                          width: getWidth(20),
                        ),
                      ),
                      SizedBox(height: getHeight(20)),

                      // Date of Birth
                      Container(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: 'Date of Birth',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0C0D0C),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: getHeight(12)),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              String day = pickedDate.day.toString().padLeft(
                                2,
                                '0',
                              );
                              String month = pickedDate.month
                                  .toString()
                                  .padLeft(2, '0');
                              String year = pickedDate.year.toString();
                              controller.dateController.text =
                                  "$day/$month/$year";
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 24,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7E7E7),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: CustomText(
                            text: controller.dateController.text.isEmpty
                                ? "Select Date"
                                : controller.dateController.text,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(20)),

                      Container(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: 'Password ',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0C0D0C),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: getHeight(12)),

                      // Password
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7E7E7),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.pass,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  hintStyle: GoogleFonts.figtree(
                                    fontSize: getWidth(16, maxWidth: 18),
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF6B6B6B),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: SizedBox(
                                      height: getHeight(30),
                                      width: getWidth(50),
                                      child: Image.asset(IconsPath.lock),
                                    ),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                    minWidth: 0,
                                    minHeight: 0,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText =
                                      !_obscureText; // toggle hide/show
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: getHeight(20)),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: _agreedToTerms,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _agreedToTerms = newValue ?? false;
                                });
                              },
                              activeColor: kPrimaryColor, // বেগুনি রং
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: CustomText(
                                text:
                                    "Agree to the Terms of service and Privacy policy.",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(30)),

                      CustomSubmitButton(text: "Register", onTap: () {}),

                      SizedBox(height: getHeight(16)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Already have an account? ',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B6B6B),
                            textAlign: TextAlign.start,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.verificationCodeScreen);
                            },
                            child: CustomText(
                              text: 'Log in',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
