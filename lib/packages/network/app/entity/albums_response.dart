// To parse this JSON data, do
//
//     final albumsReponse = albumsReponseFromJson(jsonString);

import 'dart:convert';

List<AlbumsResponse> albumsResponseFromJson(String str) =>
    List<AlbumsResponse>.from(
        json.decode(str).map((x) => AlbumsResponse.fromJson(x)));

String albumsResponseToJson(List<AlbumsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsResponse {
  int? userId;
  int? id;
  String? title;

  AlbumsResponse({
    this.userId,
    this.id,
    this.title,
  });

  factory AlbumsResponse.fromJson(Map<String, dynamic> json) => AlbumsResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
