class LoginModel {
  final String name, userid, password;
  final int id;

  LoginModel({
    required this.name,
    required this.userid,
    required this.id,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      name: json['name'],
      userid: json['user_id'],
      password: json['password'],
      id: json['id'],
    );
  }
}
