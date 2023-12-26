// To parse this JSON data, do
//
//     final albumPhotosReponse = albumPhotosReponseFromJson(jsonString);

import 'dart:convert';

List<AlbumPhotosResponse> albumPhotosResponseFromJson(String str) =>
    List<AlbumPhotosResponse>.from(
        json.decode(str).map((x) => AlbumPhotosResponse.fromJson(x)));

String albumPhotosResponseToJson(List<AlbumPhotosResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumPhotosResponse {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumPhotosResponse({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumPhotosResponse.fromJson(Map<String, dynamic> json) =>
      AlbumPhotosResponse(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
