// To parse this JSON data, do
//
//     final bookmarkReqResModel = bookmarkReqResModelFromJson(jsonString);

import 'dart:convert';

BookmarkReqResModel bookmarkReqResModelFromJson(String str) =>
    BookmarkReqResModel.fromJson(json.decode(str));

String bookmarkReqResModelToJson(BookmarkReqResModel data) =>
    json.encode(data.toJson());

class BookmarkReqResModel {
  String id;

  BookmarkReqResModel({
    required this.id,
  });

  factory BookmarkReqResModel.fromJson(Map<String, dynamic> json) =>
      BookmarkReqResModel(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
