

import 'package:app_navigation/ui/views/home_view.dart';
import 'package:app_navigation/ui/views/login_view.dart';
import 'package:app_navigation/ui/views/signup_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  HomeView homeView;

  LoginView loginView;

  SignupView signupView;
}