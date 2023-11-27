class LoginModel {
  LoginModel({
    required this.username,
    required this.password,
  });

  final String? username;
  final String? password;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
