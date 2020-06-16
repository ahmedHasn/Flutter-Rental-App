import 'package:app_navigation/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:stacked_services/stacked_services.dart';

class MoreWidget extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text('DaLLiSo App',
                  style: TextStyle(color: Colors.indigoAccent))),
          backgroundColor: Colors.white),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignInButtonBuilder(
            text: 'Go with email',
            icon: Icons.email,
            onPressed: () {
              Navigator.pushNamed(context, "/login-view");
            },
            backgroundColor: Colors.blueGrey[700],
            width: 220.0,
          ),
          Divider(
            color: Colors.white,
          ),
          SignInButton(
            Buttons.Google,
            onPressed: () {},
          ),
//          Divider(color: Colors.white,),
//          SignInButton(
//            Buttons.GoogleDark,
//            onPressed: () {
//            },
//          ),
          Divider(
            color: Colors.white,
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
