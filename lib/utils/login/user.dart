import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class User {
  String email;
  List<String> roles;
  String token;
  String userId;
  String username;

  User({this.email, this.roles, this.token, this.userId, this.username});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : null;
    token = json['token'];
    userId = json['user_id'].toString();
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['token'] = this.token;
    data['user_id'] = this.userId.toString();
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return 'User{email: $email, roles: $roles, token: $token, userId: $userId, username: $username}';
  }

  void save() async {
    Map map = toJson();
    String json = convert.json.encode(map);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tricolor", json);
  }

  static Future<User> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json =  prefs.getString("tricolor");
    Map map = convert.json.decode(json);
    User user = User.fromJson(map);
    return user;
  }

  static Future<User> remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("tricolor");
  }


}
