import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class AuthenticationService {

  var client = new http.Client();

  Future login({@required String email, @required String password}) async {

    try {
      print(email);
      print(password);
      final _resultAuth = await client.post(
                                    "http://10.0.2.2:8080/api/authenticate",
                                    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
                                    body: jsonEncode(<String, dynamic>
                                          {'username': email, 'password': password , 'rememberMe': false}));
//      print(_resultAuth.statusCode);
//      return _resultAuth.statusCode.toString();
    return _resultAuth.body;
    } catch (e) {
      return e.message;
    }
  }

  Future signUp(
      {@required String username,
      @required String email,
      @required String password}) async {
    try {
      var _userAuth = await http.post('http://localhost:8080/api/register',
          headers: {'Content_type': 'application/json'},
          body: {username, email, password});
      print(_userAuth.body);
      return _userAuth != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<String> isAuthenticated() async {
    var result = await http.get('http://localhost:8080/api/authenticate',
        headers: {'Content_type': 'application/json'});
    return result.body;
  }
}
