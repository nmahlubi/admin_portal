

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:Live_Connected_Admin/core/repository/firebase_repo.dart';
import 'package:Live_Connected_Admin/core/viewmodel/login_model.dart';
import 'package:Live_Connected_Admin/core/viewmodel/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/authentication_service.dart';
import 'core/service/connected_api.dart';

GetIt locator = GetIt.instance;

void setupLocator({SharedPreferences sharedPreferences, FirebaseAuth firebaseAuth}) {
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ConnectedApi());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => RegisterModel());
  locator.registerLazySingleton(() => FirebaseRepo());
  locator.registerFactory(() => firebaseAuth);

}