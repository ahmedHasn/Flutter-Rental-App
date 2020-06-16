import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/ui/viewmodels/login_viewmodel.dart';
import 'package:app_navigation/ui/widgets/busy_button.dart';
import 'package:app_navigation/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';

class LoginView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Center(
                      child: Text('DaLLiSo App',
                          style: TextStyle(color: Colors.indigoAccent))),
                  backgroundColor: Colors.white),

              body: Form(
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      lowerHalf(context),
                      upperHalf(context),
                      loginCard(context, model)
                    ],
                  ),
                ),

              ),
            ),
        viewModelBuilder: () => LoginViewModel());
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
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Color(0xFFECF0F3),
    ),
  );
}

Widget loginCard(BuildContext context, LoginViewModel model) {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


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
                    "Login",
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
                InputField(
                  placeholder: 'Username',
                  controller: emailController,
                ),
//                TextFormField(
//                  decoration: InputDecoration(
//                      labelText: "Your Email", hasFloatingPlaceholder: true),
//                  controller: emailController,
//                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
//                TextFormField(
//                  decoration: InputDecoration(
//                      labelText: "Password", hasFloatingPlaceholder: true),
//                  controller: passwordController,
//                  obscureText: true,
//                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      child: Text("Forgot Password ?"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BusyButton(
                      title: 'Login',
                      busy: model.isBusy,
                      onPressed: () {
                        model.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
//                    FlatButton(
//                      child: Text("Login"),
//                      color: Color(0xFF4B9DFE),
//                      textColor: Colors.white,
//                      padding: EdgeInsets.only(
//                          left: 38, right: 38, top: 15, bottom: 15),
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(5)),
//                      onPressed: () {},
//                    )
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
          Text(
            "Don't have an account ?",
            style: TextStyle(color: Colors.grey),
          ),
          FlatButton(
            onPressed: () {
              _navigationService.navigateTo('/signup-view');
            },
            textColor: Colors.black87,
            child: Text("Create Account"),
          )
        ],
      )
    ],
  );

}
