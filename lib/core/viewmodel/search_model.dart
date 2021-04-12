import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/repository/local_data.dart';
import 'package:Live_Connected_Admin/core/viewmodel/base_model.dart';

import '../../locator.dart';

class SearchModel extends BaseModel {
  LocalDataRepo _localDataRepo = locator<LocalDataRepo>();
  String errorMessage;

  String searchTerm;

  List<ClientUserDto> users = [];
  List<ClientUserDto> usersList = [];

  Future search(String searchTerm) async {
    setState(ViewState.Busy);
    if (searchTerm.isEmpty) {
      usersList = users;
    } else {
      List tempCompanyList = new List<ClientUserDto>();
      for (int i = 0; i < users.length; i++) {
        if (users[i]
            .firstName
            .toLowerCase()
            .contains(searchTerm.toLowerCase())) {
          tempCompanyList.add(users[i]);
        }
      }
      usersList = tempCompanyList;
    }
    this.searchTerm = searchTerm;
    setState(ViewState.Idle);
  }

  Future getUsers() async {
    setState(ViewState.Busy);
    errorMessage = null;
    usersList = [];
    _localDataRepo.getUsersList().then((users) {
      this.usersList.addAll(users);
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}
