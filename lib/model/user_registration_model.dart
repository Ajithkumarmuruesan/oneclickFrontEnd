class UserregistrationModel {
  UserregistrationModel({
    required this.name,
    required this.username,
    required this.password,
  });

  final String? name;
  final String? username;
  final String? password;

  factory UserregistrationModel.fromJson(Map<String, dynamic> json) {
    return UserregistrationModel(
      name: json["name"],
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "password": password,
      };
}
