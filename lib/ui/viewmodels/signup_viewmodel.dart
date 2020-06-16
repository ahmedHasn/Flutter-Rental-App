import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/services/auth/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();


  Future signUp({@required String username, @required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.signUp(username: username, email: email, password: password);
    setBusy(false);
    if(result is bool) {
      if(result){
        _navigationService.navigateTo('/home-view');
      }else{
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    }else {
      await _dialogService.showDialog(
        title: 'Sign up Failure',
        description: result
      );
    }
  }
}