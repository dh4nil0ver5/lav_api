class LoginModel {
  bool message;
  User user;
  String token;

  LoginModel({
    this.message = false,
    required this.user,
    this.token = "no-token",
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: (json["message"] == "ok" ? true:false),
        user: User.fromJson(json["data"]["user"]),
        token: json["token"],
      );
}

class User {
  int id;
  String name;
  String email;

  User({
    this.id = 0,
    this.name = "no-name",
    this.email = "no-email",
  });

  factory User.fromJson(Map<String, dynamic> json){
    print(json);
    return User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );
  }
}
