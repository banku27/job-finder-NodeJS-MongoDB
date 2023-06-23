import 'dart:convert';

// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String id;
  String username;
  String email;
  bool isAdmin;
  bool isAgent;
  List<String> skills;
  String profile;
  DateTime updatedAt;
  String userToken;

  LoginResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isAdmin,
    required this.isAgent,
    required this.skills,
    required this.profile,
    required this.updatedAt,
    required this.userToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        isAgent: json["isAgent"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        profile: json["profile"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        userToken: json["userToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "isAdmin": isAdmin,
        "isAgent": isAgent,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "profile": profile,
        "updatedAt": updatedAt.toIso8601String(),
        "userToken": userToken,
      };
}
