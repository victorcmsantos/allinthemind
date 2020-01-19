class ListUsers {
  String email;
  List<String> roles;
  String username;

  ListUsers({this.email, this.roles, this.username});

  ListUsers.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : null;
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return 'ListUsers{email: $email, roles: $roles, username: $username}';
  }


}
