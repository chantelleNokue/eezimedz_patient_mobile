// dart class to handle push notifications from firebase
// import 'dart:convert';
//
// import '../../main.dart';
// import '../../pages/prescriptions/viewprescriptions.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async{
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// class NotificationsClass{
//   final firebaseMessaging = FirebaseMessaging.instance;
//
//   //android notifications category
//   final androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'high Importance Notifications',
//     description: 'This Channel is used for important notifications',
//     importance: Importance.defaultImportance,
//   );
//
//   //local notifications instance
//   final localNotification = FlutterLocalNotificationsPlugin();
//
//
//   //function to handle navigation when user opens app through the notification
//   void handleMessage(RemoteMessage? message){
//     if(message == null) return;
//
//     navigatorKey.currentState?.pushNamed(
//       ViewPrescriptions.route,
//       arguments: message,
//     );
//   }
//
//
//   Future initPushNotifications() async{
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     //background message handler
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     //handler for when the application is open
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if(notification == null) return;
//
//       localNotification.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             androidChannel.id,
//             androidChannel.name,
//             channelDescription: androidChannel.description,
//             icon: '@drawable/ic_launcher',
//           )
//         ),
//         payload: jsonEncode(message.toMap()),
//       );
//     });
//   }
//
//   Future initLocalNotifications() async{
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android);
//
//     await localNotification.initialize(settings);
//
//     final platform = localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//
//     //creating android notification channel
//     await platform?.createNotificationChannel(androidChannel);
//   }
//
//
//   Future<void> initNotifications() async{
//     await firebaseMessaging.requestPermission();
//
//     // get firebase cloud messaging token
//     // used to send notifications to the specific device
//     final fcmToken = await firebaseMessaging.getToken();
//
//     // TODO: add functionality to save this token somewhere secure
//     // print('Token: ${fcmToken}');
//
//     initPushNotifications();
//     initLocalNotifications();
//
//   }
// }