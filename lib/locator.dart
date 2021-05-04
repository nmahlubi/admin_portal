import 'package:Live_Connected_Admin/core/model/user.dart';
import 'package:Live_Connected_Admin/ui/view/subscribers_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:Live_Connected_Admin/core/repository/firebase_repo.dart';
import 'package:Live_Connected_Admin/core/viewmodel/login_model.dart';
import 'package:Live_Connected_Admin/core/viewmodel/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/repository/local_data.dart';
import 'core/service/authentication_service.dart';
import 'core/service/connected_api.dart';
import 'core/viewmodel/home_model.dart';
import 'core/viewmodel/search_model.dart';
import 'core/viewmodel/user_model.dart';

GetIt locator = GetIt.instance;

void setupLocator(
    {SharedPreferences sharedPreferences, FirebaseAuth firebaseAuth}) {
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ConnectedApi());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => RegisterModel());
  locator.registerLazySingleton(() => FirebaseRepo());
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => UserModel());
  locator.registerFactory(() => SearchModel());
  //locator.registerLazySingleton(() => SubscribersView());
  locator.registerLazySingleton(() => LocalDataRepo());
  locator.registerFactory(() => firebaseAuth);
}
