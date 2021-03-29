import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/ui/view/home_view.dart';
import 'package:Live_Connected_Admin/ui/view/login_view.dart';
import 'package:Live_Connected_Admin/ui/view/register_view.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        // var clientUserDto = settings.arguments as ClientUserDto;
        return MaterialPageRoute(builder: (_) => HomeView());
      case "login":
        return MaterialPageRoute(builder: (_) => LoginView());
      case "register":
        return MaterialPageRoute(builder: (_) => RegisterView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
