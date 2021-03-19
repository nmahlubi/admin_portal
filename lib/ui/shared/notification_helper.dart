import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nomah/core/service/notification_service.dart';
import 'package:nomah/core/shared/core_helpers.dart';

import '../../locator.dart';
import '../../main.dart';
import 'received_notification.dart';

class NotificationHelper {
  static void init(BuildContext context) {
    print("NotificationHelper init");
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubject(context);
    _configureSelectNotificationSubject(context);

    NotificationService messageService = locator<NotificationService>();
    messageService.init((message) {
      print("NotificationHelper Message received");
      onMessageReceived(message);
    }, (message) {
      navigateToScreen(message, context);
    });
  }

  static void destroy() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
  }

  static Future<void> _showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'myChannelId', 'myChannelName', 'myChannelDescription',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: '/');
  }

  static void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static void _configureDidReceiveLocalNotificationSubject(
      BuildContext context) {
    try {
      didReceiveLocalNotificationSubject.stream
          .listen((ReceivedNotification receivedNotification) async {
        /*await showDialog(
          context: context,
          builder: (BuildContext context) =>
              CupertinoAlertDialog(
                title: receivedNotification.title != null
                    ? Text(receivedNotification.title)
                    : null,
                content: receivedNotification.body != null
                    ? Text(receivedNotification.body)
                    : null,
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Ok'),
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  )
                ],
              ),
        );*/
        _showNotification(receivedNotification?.title ?? "New Notification", receivedNotification?.body ?? "Open App");
      });
    }catch(e) {
      print("Stream Already listening");
    }
  }

  static void _configureSelectNotificationSubject(BuildContext context) {
    try {
      selectNotificationSubject.stream.listen((String payload) async {
        /*await Navigator.pushNamedAndRemoveUntil(
          context, 'landing', (Route<dynamic> route) => false,
          arguments: payload);*/
      });
    } catch(e) {
      print("Stream Already listening");
    }
  }

  static void navigateToScreen(
      Map<String, dynamic> message, BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'landing', (Route<dynamic> route) => false,
        arguments: "messages");
  }

  static Future<dynamic> onMessageReceived(
      Map<String, dynamic> message,) async {

    if(CoreHelpers.getDeviceType() == "IOS") {
      if (message['title'] != null) {
        print("_onMessageReceived ${json.encode(message['title'])}");
      }

      _showNotification(message['title'], message['body']);
    } else {
      if(message['data'] != null && message['data']['title'] != null) {
        print("_onMessageReceived ${json.encode(message['data']['title'])}");
      }

      _showNotification(message['data']['title'], message['data']['body']);
    }
  }
}
