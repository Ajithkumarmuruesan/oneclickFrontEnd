class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.username,
  });

  final String? token;
  final String? username;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"],
      username: json["username"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "username": username,
      };
}
