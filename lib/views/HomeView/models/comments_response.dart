// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  String? detail;
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  Comments({
    this.detail,
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        detail: json["detail"],
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  int? commenter;
  int? commentedOn;
  String? comment;
  DateTime? date;
  bool? status;
  int? up;
  int? down;
  User? user;

  Result({
    this.id,
    this.commenter,
    this.commentedOn,
    this.comment,
    this.date,
    this.status,
    this.up,
    this.down,
    this.user,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        commenter: json["commenter"],
        commentedOn: json["commented_on"],
        comment: json["comment"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        up: json["up"],
        down: json["down"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "commenter": commenter,
        "commented_on": commentedOn,
        "comment": comment,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "up": up,
        "down": down,
        "user": user?.toJson(),
      };
}

class User {
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  dynamic photoUrl;

  User({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "photo_url": photoUrl,
      };
}
