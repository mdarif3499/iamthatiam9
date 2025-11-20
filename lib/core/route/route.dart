import 'package:get/get_navigation/get_navigation.dart';

import '../../feature/auth/screen/signin_screen.dart';
import '../../feature/auth/screen/signup_screen.dart';
import '../../feature/auth/screen/verification_code_screen.dart';
import '../../feature/onboarding/screen/onboarding_role_screen.dart';
import '../../feature/splash_screen/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = "/";
  static const String onboardingRoleScreen = "/onboardingRoleScreen";
  static const String signupScreen = "/signupScreen";
  static const String signInScreen = "/signInScreen";
  static const String verificationCodeScreen = "/verificationCodeScreen";

  static List<GetPage> routes = [

    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: onboardingRoleScreen,
      page: () => OnboardingRoleScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: verificationCodeScreen,
      page: () => VerificationCodeScreen(),
      transition: Transition.rightToLeft,
    ),


  ];
}
