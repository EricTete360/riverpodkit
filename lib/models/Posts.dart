// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
    Posts({
      required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
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
