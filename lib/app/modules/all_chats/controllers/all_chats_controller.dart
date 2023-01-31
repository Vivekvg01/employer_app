import 'package:employer_app/app/modules/all_chats/api/all_chats_api.dart';
import 'package:get/get.dart';

class AllChatsController extends GetxController {
  @override
  void onInit() {
    AllChatsApi().getAllChats();
    super.onInit();
  }
}
