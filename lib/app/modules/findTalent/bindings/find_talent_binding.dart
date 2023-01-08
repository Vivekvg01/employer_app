import 'package:get/get.dart';

import '../controllers/find_talent_controller.dart';

class FindTalentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindTalentController>(() => FindTalentController());
  }
}
