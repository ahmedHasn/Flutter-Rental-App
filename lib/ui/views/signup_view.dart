import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/ui/viewmodels/signup_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupView extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, chile) => Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Center(
                      child: Text('DaLLiSo App',
                          style: TextStyle(color: Colors.indigoAccent))),
                  backgroundColor: Colors.white),
              body: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    lowerHalf(context),
                    upperHalf(context),
                    loginCard(context)
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => SignupViewModel());
  }
}

Widget upperHalf(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    child: Image.asset(
      'assets/images/house.jpg',
      fit: BoxFit.cover,
    ),
  );
}

Widget lowerHalf(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter / 2,
    child: Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFECF0F3),
    ),
  );
}

Widget loginCard(BuildContext context) {
  final NavigationService _navigationService = locator<NavigationService>();
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Your Username", hasFloatingPlaceholder: true),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Your Email", hasFloatingPlaceholder: true),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password", hasFloatingPlaceholder: true),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
//                    MaterialButton(
//                      onPressed: () {},
//                      child: Text("Forgot Password ?"),
//                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FlatButton(
                      child: Text("SignUp"),
                      color: Color(0xFF4B9DFE),
                      textColor: Colors.white,
                      padding: EdgeInsets.only(
                          left: 38, right: 38, top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
        ],
      )
    ],
  );
}
