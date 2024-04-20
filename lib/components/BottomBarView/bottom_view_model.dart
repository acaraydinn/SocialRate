import 'package:get/get.dart';
import 'package:socialrate/views/ProfileView/profile_view_model.dart';

class BottombarViewModel extends GetxController {
  RxInt selectedIndex = 0.obs;
  selectTab(int tabIndex) {
    selectedIndex.value = tabIndex;
    if (tabIndex == 2) {
      ProfileViewModel profileViewModel = Get.put(ProfileViewModel());
    }
  }
}
