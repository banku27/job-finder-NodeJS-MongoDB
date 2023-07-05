// To parse this JSON data, do
//
//     final allBookmarks = allBookmarksFromJson(jsonString);
import 'dart:convert';

List<AllBookmarks> allBookmarksFromJson(String str) => List<AllBookmarks>.from(
    json.decode(str).map((x) => AllBookmarks.fromJson(x)));

String allBookmarksToJson(List<AllBookmarks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllBookmarks {
  final String id;
  final String userId;
  final Job job;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  AllBookmarks({
    required this.id,
    required this.userId,
    required this.job,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AllBookmarks.fromJson(Map<String, dynamic> json) => AllBookmarks(
        id: json["_id"],
        userId: json["userId"],
        job: Job.fromJson(json["job"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "job": job.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Job {
  String id;
  String title;
  String location;
  String description;
  String company;
  String salary;
  String period;
  String contract;
  List<String> requirements;
  String imageUrl;
  String agentId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Job({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.company,
    required this.salary,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        description: json["description"],
        company: json["company"],
        salary: json["salary"],
        period: json["period"],
        contract: json["contract"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "location": location,
        "description": description,
        "company": company,
        "salary": salary,
        "period": period,
        "contract": contract,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
