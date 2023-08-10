// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
// InitializationSettings initializationSettings = const InitializationSettings(
//   android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//   iOS: DarwinInitializationSettings(),
// );

// sealed class NotificationService {
//   const NotificationService._();

//   static Future<void> initialize() async {

//     await setupFlutterNotifications();
//     foregroundNotification();
//     backgroundNotification();
//     await terminateNotification();
//   }

//   static Future<void> setupFlutterNotifications() async {
//     if (Platform.isIOS) {

//     }
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);


//   }



//   static void foregroundNotification() {

//     ///When tapped
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (response) async {
//       debugPrint('foreground notification tapped');
//       debugPrint('$response');
//     });
//   }



//   static Future<void> terminateNotification() async {
//     final RemoteMessage? remoteMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage == null) {
//       FirebaseMessaging.onBackgroundMessage(
//         _firebaseMessagingBackgroundHandler,
//       );
//     } else {
//       showFlutterNotification(remoteMessage);
//     }
//   }
// }

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   await NotificationService.setupFlutterNotifications();
//   NotificationService.showFlutterNotification(message);
// }
