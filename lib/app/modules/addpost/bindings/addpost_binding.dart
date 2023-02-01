import 'package:employer_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/addpost_controller.dart';

class AddpostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddpostController>(
      () => AddpostController(),
    );
  }
}
