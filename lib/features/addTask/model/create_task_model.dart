// To parse this JSON data, do
//
//     final taskApiSuccess = taskApiSuccessFromJson(jsonString);

import 'dart:convert';

TaskApiSuccess taskApiSuccessFromJson(String str) =>
    TaskApiSuccess.fromJson(json.decode(str));

String taskApiSuccessToJson(TaskApiSuccess data) => json.encode(data.toJson());

class TaskApiSuccess {
  bool success;
  int statusCode;
  Task data;

  TaskApiSuccess({
    required this.success,
    required this.statusCode,
    required this.data,
  });

  factory TaskApiSuccess.fromJson(Map<String, dynamic> json) => TaskApiSuccess(
        success: json["success"],
        statusCode: json["statusCode"],
        data: Task.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Task {
  String title;
  DateTime dueDate;
  int userId;
  int categoryId;
  dynamic description;
  int id;
  bool completed;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.title,
    required this.dueDate,
    required this.userId,
    required this.categoryId,
    required this.description,
    required this.id,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"],
        dueDate: DateTime.parse(json["dueDate"]),
        userId: json["userId"],
        categoryId: json["categoryId"],
        description: json["description"],
        id: json["id"],
        completed: json["completed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "dueDate": dueDate.toIso8601String(),
        "userId": userId,
        "categoryId": categoryId,
        "description": description,
        "id": id,
        "completed": completed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
