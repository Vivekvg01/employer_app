import 'package:employer_app/app/modules/chat_room/views/chat_room_view.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_chats_controller.dart';

class AllChatsView extends GetView<AllChatsController> {
  const AllChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allChatsController = Get.put(AllChatsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Messages'),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, index) => ListTile(
          onTap: () => Get.to(() => ChatRoomView()),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(defaultProfileImgae),
          ),
          title: const Text("Freelancer"),
          subtitle: const Text('Hey'),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 20,
      ),
    );
  }
}
