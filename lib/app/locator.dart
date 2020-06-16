import 'package:app_navigation/map/service/location_service.dart';
import 'package:app_navigation/map/service/map_service.dart';
import 'package:app_navigation/services/auth/authentication_service.dart';
import 'package:app_navigation/services/ui/select_index.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => SelectIndexService());
  locator.registerLazySingleton(() => MapService());
  locator.registerLazySingleton(() => LocationService());
}