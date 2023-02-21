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

  RxBool isLoading = false.obs;

  RxList<MyChatModel>? myChatList = <MyChatModel>[].obs;

  void getMyChats() async {
    isLoading(true);
    MyChatsListModel? response = await AllChatsApi().getAllChats();
    if (response?.myChatList != null) {
      if (response!.myChatList != null) {
        myChatList?.value = response.myChatList!;
      }
    }
    isLoading(false);
  }
}
