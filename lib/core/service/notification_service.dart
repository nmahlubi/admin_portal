//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nomah/core/shared/core_helpers.dart';
import 'package:nomah/ui/shared/notification_helper.dart';

/*class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  String localToken;

  void init(Function(Map<String, dynamic>) onMessageReceived,
      Function(Map<String, dynamic>) navigateToScreen) {
    //_fcm.subscribeToTopic('CONNECT');

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage:$message");
        onMessageReceived(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        navigateToScreen(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        navigateToScreen(message);
      },
      onBackgroundMessage: CoreHelpers.getDeviceType() == "ANDROID" ? NotificationHelper.onMessageReceived : null,
    );

    _fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));

    _fcm.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _fcm.getToken().then((String token) {
      assert(token != null);
      localToken = token;
    });
  }

  Future<String> getMessagingToken() async {
    String token = localToken ?? await _fcm.getToken();

    return token;
  }
}*/
