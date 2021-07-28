import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/ui/view/advert_view.dart';
import 'package:Live_Connected_Admin/ui/view/children_view.dart';
import 'package:Live_Connected_Admin/ui/view/event_view.dart';
import 'package:Live_Connected_Admin/ui/view/subscribers_view.dart';
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
        return MaterialPageRoute(builder: (_) => HomeView());
      case "login":
        return MaterialPageRoute(builder: (_) => LoginView());
      case "register":
        return MaterialPageRoute(builder: (_) => RegisterView());
      case "subscribersView":
        return MaterialPageRoute(builder: (_) => SubscribersView());
      case "EventView":
        return MaterialPageRoute(builder: (_) => ChildrenView());
      case "eventView":
        return MaterialPageRoute(builder: (_) => EventView());
      case "usersView":
        return MaterialPageRoute(builder: (_) => UsersView());
      case "advertView":
        return MaterialPageRoute(builder: (_) => AdvertView());
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
