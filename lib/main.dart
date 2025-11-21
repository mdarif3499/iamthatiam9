import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/const/app_colors.dart';
import 'core/const/app_sizes.dart';
import 'core/helper/shared_preferences_helper.dart';
import 'core/route/route.dart';


import 'feature/splash_screen/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await SharedPreferencesHelper().init();

  runApp(MyApp(initialRoute: AppRoutes.splashScreen));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return GetMaterialApp(
      title: 'baloomoon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
      ),

      initialRoute: initialRoute, // value from constructor

      getPages: AppRoutes.routes,

      builder: EasyLoading.init(),
    );
  }
}





