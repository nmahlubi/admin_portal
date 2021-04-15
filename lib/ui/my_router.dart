import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/ui/view/user_details_view.dart';
import 'package:Live_Connected_Admin/ui/view/users_view.dart';
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
      case "usersView":
        return MaterialPageRoute(builder: (_) => UsersView());
      case "userDetailsView":
        var clientUserDto = settings.arguments as ClientUserDto;
        return MaterialPageRoute(
            builder: (_) => UsersDetailsView(clientUserDto: clientUserDto));
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
