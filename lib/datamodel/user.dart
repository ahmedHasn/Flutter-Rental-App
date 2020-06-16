
class User {
  String id;
  String login;
  String firstName;
  String lastName;
  String email;
  bool activated;
  String langKey;
  List<String> authorities;
  String createdBy;
  var createdDate;
  String lastModifiedBy;
  var lastModifiedDate;

  User.initial() {
    id = '';
    login = '';
    firstName = '';
    lastName = '';
    email = '';
    activated = false;
    langKey = '';
    authorities = [];
    createdBy = '';
    createdDate = '';
    lastModifiedBy = '';
    lastModifiedDate = '';
  }
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    activated = json['activated'];
    langKey = json['langKey'];
    authorities = json['authorities'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
  }
}