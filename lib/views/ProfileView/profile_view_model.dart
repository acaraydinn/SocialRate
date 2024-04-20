import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:socialrate/views/ProfileView/models/profile_response.dart';
import '../../managers/network_manager.dart';

class ProfileViewModel extends GetxController {
  final NetworkManager _netwokrManager = NetworkManager();
  Rx<ProfileResponse> profileResponse = ProfileResponse().obs;

  Future<ProfileResponse?> getProfile() async {
    var response = await _netwokrManager.get("profile");
    profileResponse.value = profileResponseFromJson(response.body);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      print(response);
      return profileResponse.value;
    }

    update();
    return null;
  }

  @override
  void onReady() async {
    getProfile();
    super.onReady();
  }
}
