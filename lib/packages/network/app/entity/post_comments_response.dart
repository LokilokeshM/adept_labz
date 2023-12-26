// To parse this JSON data, do
//
//     final postCommentsResponse = postCommentsResponseFromJson(jsonString);

import 'dart:convert';

List<PostCommentsResponse> postCommentsResponseFromJson(String str) =>
    List<PostCommentsResponse>.from(
        json.decode(str).map((x) => PostCommentsResponse.fromJson(x)));

String postCommentsResponseToJson(List<PostCommentsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostCommentsResponse {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostCommentsResponse({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory PostCommentsResponse.fromJson(Map<String, dynamic> json) =>
      PostCommentsResponse(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
