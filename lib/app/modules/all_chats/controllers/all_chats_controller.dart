import 'package:employer_app/app/modules/all_chats/api/all_chats_api.dart';
import 'package:get/get.dart';
import '../models/my_chat_list_model.dart';
import '../models/my_chats_model.dart';

class AllChatsController extends GetxController {
  @override
  void onInit() {
    getMyChats();
    super.onInit();
  }

  RxList<MyChatModel>? myChatList = <MyChatModel>[].obs;

  void getMyChats() async {
    MyChatsListModel? response = await AllChatsApi().getAllChats();
    if (response?.myChatList != null) {
      if (response!.myChatList != null) {
        myChatList?.value = response.myChatList!;
      }
    }
  }
}
