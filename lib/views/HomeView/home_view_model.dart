import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:socialrate/managers/network_manager.dart';
import 'package:socialrate/views/HomeView/models/comments_response.dart';

class HomeViewModel extends GetxController {
  final NetworkManager _netwokrManager = NetworkManager();
  Comments comments = Comments();
  RxInt postCount = 0.obs;

  Future<Comments?> getComments() async {
    var response = await _netwokrManager.get("home/");
    comments = commentsFromJson(response.body);
    print(response.body);

    if (response.statusCode == 200) {
      postCount.value = comments.count ?? 0;
      print(postCount);
      return comments;
    }
    return null;
  }

  Future<void> getProfile() async {
    try {
      final response = await _netwokrManager.get("profile");

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        // Process the response as needed
      } else {
        print('Error: ${response.statusCode}');
        // Handle error as needed
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exception as needed
    }
  }

  Future<bool> setEvulation(
      {required int commentID,
      required String userID,
      required String evlulation}) async {
    final body = {
      'comment': commentID,
      'commenter': userID,
      'evaluation': evlulation,
    };

    var response = await _netwokrManager.post("comment/evaluation", body);

    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      postCount.value = comments.count ?? 0;
      print(postCount);
      return true;
    }
    return true;
  }

  @override
  void onReady() async {
    getComments();
    getProfile();
    super.onReady();
  }
}
