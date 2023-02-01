import 'package:employer_app/app/modules/addpost/views/addpost_view.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void gotoAddPost() {
    Get.to(() => AddpostView());
  }
}
