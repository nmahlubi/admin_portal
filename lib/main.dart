import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:Live_Connected_Admin/locator.dart';
import 'package:Live_Connected_Admin/ui/my_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/model/client_user_dto.dart';
import 'core/service/authentication_service.dart';
import 'core/shared/core_helpers.dart';
import 'ui/shared/app_colors.dart';
import 'ui/shared/received_notification.dart';

final debug = false;
bool showMyDialog = true;

final StreamController<ReceivedNotification>
    didReceiveLocalNotificationSubject =
    StreamController<ReceivedNotification>();

final StreamController<String> selectNotificationSubject =
    StreamController<String>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  setupLocator(
    sharedPreferences: sharedPreferences,
    firebaseAuth: firebaseAuth,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreHelpers.setupLanguage();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColorDark));
    return StreamProvider<ClientUserDto>(
        initialData: locator<AuthenticationService>().getClientUserDto(),
        create: (context) =>
            locator<AuthenticationService>().userController.stream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Live Connected',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: primaryColor,
            canvasColor: lightShadowColor,
          ),
          initialRoute: 'login',
          onGenerateRoute: MyRouter.generateRoute,
        ));
  }
}
