// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
    String? detail;
    int? id;
    String? username;
    String? email;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    int? followed;
    int? follower;
    dynamic photoUrl;
    Rating? rating;

    ProfileResponse({
        this.detail,
        this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.followed,
        this.follower,
        this.photoUrl,
        this.rating,
    });

    factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
        detail: json["detail"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        followed: json["followed"],
        follower: json["follower"],
        photoUrl: json["photo_url"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail,
        "id": id,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "followed": followed,
        "follower": follower,
        "photo_url": photoUrl,
        "rating": rating?.toJson(),
    };
}

class Rating {
    String? face;
    String? body;
    String? persona;
    String? total;

    Rating({
        this.face,
        this.body,
        this.persona,
        this.total,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        face: json["face"],
        body: json["body"],
        persona: json["persona"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "face": face,
        "body": body,
        "persona": persona,
        "total": total,
    };
}
