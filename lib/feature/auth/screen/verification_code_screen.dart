import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// আপনার কাস্টম পাথগুলো
import 'package:iamthatiam9/core/const/icons_path.dart';
import 'package:iamthatiam9/core/global_widget/custom_appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_sizes.dart';
import '../../../core/global_widget/custom_submit_button.dart';
import '../../../core/global_widget/custom_text.dart';
import 'package:get/get.dart';
import '../controller/varification_code_controller.dart';


class CustomVerifiedIcon extends StatelessWidget {
  const CustomVerifiedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xFF673AB7),
      radius: 40,
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}

class VerificationSuccessDialog extends StatelessWidget {
  const VerificationSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 40, bottom: 20, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 2. Verified Text
          const Text(
            "Verified",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          // 3. Success Message
          const Text(
            "Your account has been verified successfully.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),

          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK',
                  style: TextStyle(fontSize: 18, color: Color(0xFF673AB7))), // বেগুনি রঙ ব্যবহার করা হয়েছে
            ),
          ),
        ],
      ),
    );
  }
}


void showVerificationSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          VerificationSuccessDialog(),
          CustomVerifiedIcon(),
        ],
      );
    },
  );
}


// --- মূল স্ক্রিন উইজেট ---

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});


  final controller = Get.put(VarificationCodeController());

  @override
  Widget build(BuildContext context) {
    const Color kBackgroundColor = Color(0xFFF4F6F9);
    const kArrowIcon = "assets/icons/arrow.png";

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: "Verification Code",
        leadingWidth: 40,
        leading: Image.asset(
          IconsPath.arrow,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
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
                        text: "Verification Code",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text0C0D0C,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: "Enter the verification code that we have sent to your email",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textB6B,
                        ),
                      ),
                      SizedBox(height: getHeight(32)),

                      Center(
                        child: SizedBox(
                          width: getWidth(240),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8),
                              fieldHeight: getWidth(50),
                              fieldWidth: getWidth(50),
                              fieldOuterPadding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              activeFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              inactiveColor: const Color(0xFFd4dbe6),
                              selectedColor: const Color(0xFFd4dbe6),
                              activeColor: AppColors.primaryColor, // আপনার AppColors ব্যবহার করুন
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            enableActiveFill: false,
                            controller: controller.otpController,
                            onCompleted: controller.onOtpCompleted,
                            onChanged: controller.updateOtp,
                            beforeTextPaste: controller.canPasteText,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(32)),

                      CustomSubmitButton(
                          text: "Continue",
                          onTap: () {
                            showVerificationSuccessDialog(context);

                          }),
                      // --- ডায়ালগ কল শেষ ---

                      SizedBox(height: getHeight(32)),

                      Obx(
                            () => Container(
                          alignment: Alignment.center,
                          child: controller.secondsRemaining.value > 0
                              ? Text.rich(
                            TextSpan(
                              text: "remaining ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.textB6B,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                  "${controller.secondsRemaining.value} s",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0A2833),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : TextButton(
                            onPressed: controller.resendCode,
                            child: Text(
                              "Re-send code",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
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