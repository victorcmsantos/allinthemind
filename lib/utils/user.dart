class User {
  String nome;
  String email;
  String token;
  String id;

  List<String> roles;

  User.fromJson(Map<String, dynamic> map)
      : nome = map["username"],
        email = map["email"],
        token = map["token"],
        id = map["user_id"].toString(),
        roles = map["roles"] != null
            ? map["roles"].map<String>((role) => role.toString()).toList()
            : null;

  @override
  String toString() {
    return 'User{nome: $nome, email: $email, token: $token, id: $id, roles: $roles}';
  }
}
