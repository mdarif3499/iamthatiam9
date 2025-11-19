import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AppValidator {
  AppValidator._();

  static String? validateEmail(String? value) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = Colors.white
      ..maskType = EasyLoadingMaskType.none
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..textColor = Colors.white
      ..fontSize = 18.0
      ..backgroundColor = Colors.red;

    if (value == null || value.isEmpty) {
      EasyLoading.showError(
        'Email is required.',
        duration: const Duration(seconds: 2),
      );

      return 'Email is required.';
    }

    final emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      EasyLoading.showError(
        'Invalid email address.',
        duration: const Duration(seconds: 2),
      );

      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      EasyLoading.showError(
        'Password is required.',
        duration: const Duration(seconds: 2),
      );
      return 'Password is required.';
    }

    if (value.length < 6) {
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorColor = Colors.white
        ..maskType = EasyLoadingMaskType.none
        ..toastPosition = EasyLoadingToastPosition.bottom
        ..textColor = Colors.white
        ..backgroundColor = Colors.red
        ..fontSize = 16;

      EasyLoading.showToast(
        'Password must be at least 6 characters.',
        duration: const Duration(seconds: 2),
        toastPosition: EasyLoadingToastPosition.bottom,
        dismissOnTap: true,
      );

      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  static String? validatePasswordLogin(String? value) {
    if (value == null || value.isEmpty) {
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorColor = Colors.white
        ..maskType = EasyLoadingMaskType.none
        ..toastPosition = EasyLoadingToastPosition.center
        ..textColor = Colors.white
        ..backgroundColor = Colors.red
        ..fontSize = 16;

      EasyLoading.showError(
        'Password is required.',
        duration: const Duration(seconds: 2),
      );

      return 'Password is required.';
    }

    if (value.length < 6) {
      EasyLoading.showToast(
        'Password must be at least 6 characters.',
        duration: const Duration(seconds: 2),
        toastPosition: EasyLoadingToastPosition.center,
        dismissOnTap: true,
      );

      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    return null;
  }
}

//jcidncnzikcfn