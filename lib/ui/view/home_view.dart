import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';

class HomeView extends StatelessWidget {
//  final ClientUserDto clientUserDto;
//
//  const HomeView({Key key, this.clientUserDto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Connect Admin'),
      ),
      drawer: CustomDrawer(),
    );
  }
}
