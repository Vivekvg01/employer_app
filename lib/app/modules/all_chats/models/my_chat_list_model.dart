// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employer_app/app/modules/all_chats/models/my_chats_model.dart';

class MyChatsListModel {
  List<MyChatModel>? myChatList;

  MyChatsListModel(
    this.myChatList,
  );

  MyChatsListModel.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson[''] != null) {
      myChatList = <MyChatModel>[];
      parsedJson[''].forEach((val) {
        myChatList!.add(MyChatModel.fromJson(val));
      });
    }
  }
}
