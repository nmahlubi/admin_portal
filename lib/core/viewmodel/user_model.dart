import 'package:Live_Connected_Admin/core/service/authentication_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class UserModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
}
