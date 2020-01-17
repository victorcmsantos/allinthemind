//class User {
//  String nome;
//  String email;
//  String token;
//  String id;
//
//  List<String> roles;
//
//  User.fromJson(Map<String, dynamic> map)
//      : nome = map["username"],
//        email = map["email"],
//        token = map["token"],
//        id = map["user_id"].toString(),
//        roles = map["roles"] != null
//            ? map["roles"].map<String>((role) => role.toString()).toList()
//            : null;
//
//  @override
//  String toString() {
//    return 'User{nome: $nome, email: $email, token: $token, id: $id, roles: $roles}';
//  }
//}

class User {
  String email;
  List<String> roles;
  String token;
  int userId;
  String username;

  User({this.email, this.roles, this.token, this.userId, this.username});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : null;
    token = json['token'];
    userId = json['user_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return 'User{email: $email, roles: $roles, token: $token, userId: $userId, username: $username}';
  }
}
