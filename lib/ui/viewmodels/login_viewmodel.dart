import 'dart:convert';

import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/services/auth/authentication_service.dart';
import 'package:app_navigation/services/ui/select_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SelectIndexService _selectIndexService = locator<SelectIndexService>();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    final response =
        await _authenticationService.login(email: email, password: password);
    setBusy(false);
    Map<String, dynamic> user = jsonDecode(response);
    if(user['id_token'] != null){
      _selectIndexService.onTapped(0);
      _navigationService.navigateTo('/');
    }else{
      await _dialogService.showDialog(
      title: 'Login Failure', description: user['message']);
    }


//    if (response =='200') {
//      _selectIndexService.onTapped(0);
//      _navigationService.navigateTo('/');
//      }else {
//        await _dialogService.showDialog(
//          title: 'Login Failure',
//          description: 'Couldn\'t login at this moment. Please try again later',
//        );
//      }
//    if (response == '200') {
//      _selectIndexService.onTapped(0);
//      _navigationService.navigateTo('/');
//    } else {
//      await _dialogService.showDialog(
//          title: 'Login Failure', description: response);
//    }
//    if (response is bool) {
//      if (response) {
//        print(response);
//        _selectIndexService.onTapped(0);
//        _navigationService.navigateTo('/');
//      } else {
//        await _dialogService.showDialog(
//          title: 'Login Failure',
//          description: 'Couldn\'t login at this moment. Please try again later',
//        );
//      }
//    } else {
//      await _dialogService.showDialog(
//          title: 'Login Failure', description: response);
//    }
  }
}
