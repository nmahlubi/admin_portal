import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}