import 'dart:convert';

// BookmarkReqModel bookmarkReqModelFromJson(String str) => BookmarkReqModel.fromJson(json.decode(str));

// String bookmarkReqModelToJson(BookmarkReqModel data) => json.encode(data.toJson());

// class BookmarkReqModel {
//     BookmarkReqModel({
//         required this.job,
//         required this.userId,
//         required this.title,
//         required this.imageUrl,
//         required this.company,
//         required this.location,
//     });

//     final String job;
//     final String userId;
//     final String title;
//     final String imageUrl;
//     final String company;
//     final String location;

//     factory BookmarkReqModel.fromJson(Map<String, dynamic> json) => BookmarkReqModel(
//         job: json["job"],
//         userId: json["userId"],
//         title: json["title"],
//         imageUrl: json["imageUrl"],
//         company: json["company"],
//         location: json["location"],
//     );

//     Map<String, dynamic> toJson() => {
//         "job": job,
//         "userId": userId,
//         "title": title,
//         "imageUrl": imageUrl,
//         "company": company,
//         "location": location,
//     };
// }
// To parse this JSON data, do
//
//     final bookMarkReqResModel = bookMarkReqResModelFromJson(jsonString);

BookMarkReqResModel bookMarkReqResModelFromJson(String str) =>
    BookMarkReqResModel.fromJson(json.decode(str));

String bookMarkReqResModelToJson(BookMarkReqResModel data) =>
    json.encode(data.toJson());

class BookMarkReqResModel {
  String job;

  BookMarkReqResModel({
    required this.job,
  });

  factory BookMarkReqResModel.fromJson(Map<String, dynamic> json) =>
      BookMarkReqResModel(
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "job": job,
      };
}
