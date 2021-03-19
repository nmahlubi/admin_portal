

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nomah/core/repository/firebase_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/authentication_service.dart';
import 'core/service/connected_api.dart';

GetIt locator = GetIt.instance;

void setupLocator({SharedPreferences sharedPreferences, FirebaseAuth firebaseAuth}) {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ConnectedApi());
  locator.registerLazySingleton(() => FirebaseRepo());
  locator.registerFactory(() => firebaseAuth);

}