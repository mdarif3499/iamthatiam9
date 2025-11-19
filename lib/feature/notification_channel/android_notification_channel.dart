// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
// import '../../core/const/token_key.dart';
// import '../../core/helper/shared_preferences_helper.dart';
//
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   log(' Background message received: ${message.messageId}');
//   log('Data: ${message.data}');
// }
//
// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   static const AndroidNotificationChannel _androidChannel =
//   AndroidNotificationChannel(
//     'high_importance_channel',
//     'Important Notifications',
//     description: 'Used for important notifications',
//     importance: Importance.high,
//   );
//
//   Future<void> init() async {
//
//     final settings = await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     log(' Permission: ${settings.authorizationStatus}');
//
//     await _handleTokens();
//     await _createNotificationChannel();
//     await _initializeLocalNotifications();
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.onMessage.listen(_onForegroundMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen((msg) {
//       log(' Notification clicked (background): ${msg.data}');
//     });
//
//     final initialMsg = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMsg != null) {
//       log(' Opened from terminated: ${initialMsg.data}');
//     }
//   }
//
//   Future<void> _handleTokens() async {
//     try {
//       final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//       log(" APNs Token: $apnsToken");
//       final fcmToken = await FirebaseMessaging.instance.getToken();
//       log(" FCM Token: $fcmToken");
//       if (fcmToken != null && fcmToken.isNotEmpty) {
//         final prefs = SharedPreferencesHelper();
//         await prefs.setString(TokenKey.fcmToken, fcmToken);
//       }
//     } catch (e) {
//       log("⚠️ Token error: $e");
//     }
//   }
//
//   Future<void> _createNotificationChannel() async {
//     final androidPlugin = _localNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//     await androidPlugin?.createNotificationChannel(_androidChannel);
//   }
//
//   Future<void> _initializeLocalNotifications() async {
//     const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iosSettings = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//     const initSettings =
//     InitializationSettings(android: androidSettings, iOS: iosSettings);
//
//     await _localNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: (details) {
//         log('✅ Notification tapped: ${details.payload}');
//       },
//     );
//   }
//
//   void _onForegroundMessage(RemoteMessage message) {
//     log('📨 Foreground message: ${message.messageId}');
//     _showLocalNotification(message);
//   }
//
//   void _showLocalNotification(RemoteMessage message) {
//     final n = message.notification;
//     if (n == null) return;
//
//     final title = n.title ?? '';
//     final body = n.body ?? '';
//
//     // Always force right-to-left for both English and Arabic
//     final displayTitle = '\u202B$title\u202C';
//     final displayBody = '\u202B$body\u202C';
//
//     final android = AndroidNotificationDetails(
//       _androidChannel.id,
//       _androidChannel.name,
//       channelDescription: _androidChannel.description,
//       importance: Importance.high,
//       priority: Priority.high,
//       playSound: true,
//       styleInformation: BigTextStyleInformation(
//         displayBody, // ensure right-aligned body
//         htmlFormatBigText: true,
//       ),
//     );
//
//     const ios = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//
//     _localNotificationsPlugin.show(
//       n.hashCode,
//       displayTitle,
//       displayBody,
//       NotificationDetails(android: android, iOS: ios),
//     );
//   }
//
//
//
//
// // void _showLocalNotification(RemoteMessage message) {
//   //   final n = message.notification;
//   //   if (n == null) return;
//   //
//   //   // 🇴🇲 যদি title বা body Arabic হয় তাহলে RTL direction সেট করো
//   //   final bool isArabic =
//   //   RegExp(r'[\u0600-\u06FF]').hasMatch(n.body ?? n.title ?? '');
//   //
//   //   final title = n.title ?? '';
//   //   final body = n.body ?? '';
//   //
//   //   final android = AndroidNotificationDetails(
//   //     _androidChannel.id,
//   //     _androidChannel.name,
//   //     channelDescription: _androidChannel.description,
//   //     importance: Importance.high,
//   //     priority: Priority.high,
//   //     playSound: true,
//   //
//   //
//   //
//   //
//   //     styleInformation: BigTextStyleInformation(
//   //       body,
//   //
//   //       htmlFormatBigText: true,
//   //
//   //     ),
//   //   );
//   //
//   //   const ios = DarwinNotificationDetails(
//   //     presentAlert: true,
//   //     presentBadge: true,
//   //     presentSound: true,
//   //   );
//   //
//   //   // 🔸 RTL wrap (Android only visual effect)
//   //   final displayTitle =
//   //   isArabic ? '\u202B$title\u202C' : title;
//   //   final displayBody = isArabic ? '\u202B$body\u202C' : body;
//   //
//   //   _localNotificationsPlugin.show(
//   //     n.hashCode,
//   //     displayTitle,
//   //     displayBody,
//   //     NotificationDetails(android: android, iOS: ios),
//   //   );
//   // }
//
//
// }