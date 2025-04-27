// To parse this JSON data, do
//
//     final userApiResponse = userApiResponseFromJson(jsonString);

import 'dart:convert';

UserApiResponse userApiResponseFromJson(String str) =>
    UserApiResponse.fromJson(json.decode(str));

String userApiResponseToJson(UserApiResponse data) =>
    json.encode(data.toJson());

class UserApiResponse {
  bool success;
  int statusCode;
  UserModel data;

  UserApiResponse({
    required this.success,
    required this.statusCode,
    required this.data,
  });

  factory UserApiResponse.fromJson(Map<String, dynamic> json) =>
      UserApiResponse(
        success: json["success"],
        statusCode: json["statusCode"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class UserModel {
  int id;
  String email;
  String password;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<Task> tasks;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.tasks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  int id;
  String title;
  String? description;
  DateTime dueDate;
  bool completed;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int categoryId;
  Categoery categoery;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.categoryId,
    required this.categoery,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dueDate: DateTime.parse(json["dueDate"]),
        completed: json["completed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        categoryId: json["categoryId"],
        categoery: Categoery.fromJson(json["categoery"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "dueDate": dueDate.toIso8601String(),
        "completed": completed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "categoryId": categoryId,
        "categoery": categoery.toJson(),
      };
}

class Categoery {
  int id;
  String name;
  String color;

  Categoery({
    required this.id,
    required this.name,
    required this.color,
  });

  factory Categoery.fromJson(Map<String, dynamic> json) => Categoery(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}
