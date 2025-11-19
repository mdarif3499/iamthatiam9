// import 'package:najwa_brighach/core/const/app_colors.dart';
// import 'package:najwa_brighach/core/const/icons_path.dart';
// import 'package:najwa_brighach/core/global_widget/custom_submit_button.dart';
// import 'package:najwa_brighach/core/global_widget/custom_text.dart';
// import 'package:flutter/material.dart';
// import ':get/get.dart';
//
// void logoutDialog({
//   required String message,
//   required String title,
//   required VoidCallback onTap,
//   double? padding,
//   String? buttonText,
// }) {
//   Get.dialog(
//     Dialog(
//       backgroundColor: AppColors.white,
//       insetPadding: EdgeInsets.symmetric(horizontal: padding ?? 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(IconsPath.home, height: 150, width: 150),
//               const SizedBox(height: 16),
//               CustomText(
//                 text: title,
//                 fontSize: 24,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.textBlack,
//               ),
//               const SizedBox(height: 20),
//               CustomText(
//                 text: message,
//                 textAlign: TextAlign.center,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.textGrey,
//               ),
//               const SizedBox(height: 56),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomSubmitButton(
//                       text: buttonText ?? "Log Out",
//                       onTap: onTap,
//                       bgColor: Colors.transparent,
//                       border: AppColors.textFieldBorder,
//                       textColor: AppColors.textBlack,
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   Expanded(
//                     child: CustomSubmitButton(
//                       text: "Cancel",
//                       onTap: () => Get.back(),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }
