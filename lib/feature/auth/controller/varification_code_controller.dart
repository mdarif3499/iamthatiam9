import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/shared_preferences_helper.dart';

class VarificationCodeController extends GetxController{

  TextEditingController otpController = TextEditingController();
  RxString currentOtp = ''.obs;
  RxInt secondsRemaining = 60.obs;
  // final controller = Get.put(ForgotPasswordController());
  Timer? _timer;
  final prefs = SharedPreferencesHelper();

  @override
  void onInit() {
    startCountdown();
    super.onInit();
  }

  void updateOtp(String value) {
    currentOtp.value = value;
  }

  void onOtpCompleted(String otp) {
    // Add your verification logic here
  }

  bool canPasteText(String? text) {
    return true;
  }

  void startCountdown() {
    _timer?.cancel();
    secondsRemaining.value = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void resendCode() {
    startCountdown();
    // controller.sendOtp();

    // Trigger resend API here
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String? fcmToken;
  RxBool isLoading = false.obs;

  // Future<void> otpCheck() async {
  //   if (isLoading.value) return; // Prevent multiple taps
  //   isLoading.value = true;
  //
  //   // await fetchFCMToken();
  //   // Show loading spinner
  //   Get.dialog(
  //     Center(child: SpinKitCircle(size: 70, color: AppColors.primaryColor)),
  //     barrierDismissible: false,
  //   );
  //
  //   String? email = prefs.getString(TokenKey.email);
  //
  //   Map<String, String> body = {
  //     'email': email ?? "",
  //     "otp": otpController.text,
  //   };
  //   log("..........body...${body}");
  //
  //   var url = ApiUrls.verifyPhoneUrl;
  //
  //   try {
  //     var response = await NetworkCaller().postRequest(body: body, url: url);
  //
  //     var data = response.data;
  //     var message = data["message"];
  //
  //     if (response.isSuccess) {
  //       if (Get.isDialogOpen == true) Get.back();
  //
  //       log(".............${response.data}");
  //       final otpResponse = OtpVerifyResponse.fromMap(response.data);
  //
  //       prefs.remove(TokenKey.accessToken);
  //
  //
  //       await prefs.setString(TokenKey.accessToken, otpResponse.data?.token??"");
  //
  //       EasyLoading.instance
  //         ..loadingStyle = EasyLoadingStyle.custom
  //         ..indicatorColor = Colors.white
  //         ..maskType = EasyLoadingMaskType.none
  //         ..toastPosition = EasyLoadingToastPosition.bottom
  //         ..textColor = Colors.white
  //         ..fontSize = 24.0
  //         ..backgroundColor = AppColors.green;
  //       EasyLoading.showSuccess(
  //         "تمّ التحقق بنجاح",
  //         duration: const Duration(seconds: 2),
  //       );
  //       // var data = jsonDecode(response.body);
  //
  //       Get.toNamed(AppRoutes.resetPasswordScreen);
  //     } else {
  //       log("error     ${response.data}");
  //       Get.snackbar(
  //         "",
  //         "الرمز غير صحيح، الرجاء إدخال الرمز المرسل إلى بريدك.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent,
  //         colorText: Colors.white,
  //
  //         titleText: Directionality(
  //           textDirection: TextDirection.rtl,
  //           child: Text(
  //             "",
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         messageText: Directionality(
  //           textDirection: TextDirection.rtl,
  //           child: Text(
  //             "الرمز غير صحيح، الرجاء إدخال الرمز المرسل إلى بريدك.",
  //             style: TextStyle(color: Colors.white, fontSize: getWidth(20)),
  //           ),
  //         ),
  //       );
  //
  //       // EasyLoading.show(
  //       //   status: "",
  //       //   maskType: EasyLoadingMaskType.black,
  //       //   duration: const Duration(seconds: 2),
  //       //   indicator: null,
  //       //   dismissOnTap: true,
  //       //   child: Directionality(
  //       //     textDirection: TextDirection.rtl,
  //       //     child: Text(
  //       //       "الرمز غير صحيح، الرجاء إدخال الرمز المرسل إلى بريدك.",
  //       //       style: TextStyle(
  //       //         color: Colors.white,
  //       //         fontSize: 16,
  //       //       ),
  //       //       textAlign: TextAlign.right,
  //       //     ),
  //       //   ),
  //       // );
  //     }
  //   } catch (e) {
  //     if (Get.isDialogOpen == true) Get.back();
  //
  //     log("error.........${e.toString()}");
  //
  //     // Ensure dialog is closed
  //     Get.snackbar(
  //       "",
  //       "الرمز غير صحيح، الرجاء إدخال الرمز المرسل إلى بريدك.",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //
  //       titleText: Directionality(
  //         textDirection: TextDirection.rtl,
  //         child: Text(
  //           "",
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       messageText: Directionality(
  //         textDirection: TextDirection.rtl,
  //         child: Text(
  //           "الرمز غير صحيح، الرجاء إدخال الرمز المرسل إلى بريدك.",
  //           style: TextStyle(color: Colors.white, fontSize: getWidth(20)),
  //         ),
  //       ),
  //     );
  //   } finally {
  //     if (Get.isDialogOpen == true) Get.back(); // Safety close
  //     isLoading.value = false; // Reset loading
  //   }
  // }


}