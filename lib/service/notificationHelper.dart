import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../home.dart';
import '../screens/NotificationScreen.dart';

class NotificationHelper {
  static String? payload_bilgi;

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings("mipmap/ic_launcher");

    var iosInitialize = new DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    ); // darwin > ios
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) {
      NotificationHelper.onSelectNotification(details);
    });
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      required String payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      //sound: ("notification"),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: DarwinNotificationDetails());
    await fln.show(0, title, body, not, payload: payload);
  }

  static Future onSelectNotification(
      NotificationResponse notificationResponse) async {
    var payloadData = notificationResponse.payload;
    // Yapmak istediğiniz işlemleri burada belirtebilirsiniz
    //print("Bildirim verisi: $payloadData");

    navigatorKey.currentState?.push(
      MaterialPageRoute(
          builder: (context) => Notificationscreen(
                payload: payloadData.toString(),
              )),
    );
    payload_bilgi = payloadData;
    return payloadData;
  }
}
