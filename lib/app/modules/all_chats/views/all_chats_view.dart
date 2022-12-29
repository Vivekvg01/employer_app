import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_chats_controller.dart';

class AllChatsView extends GetView<AllChatsController> {
  const AllChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kdarkGreen,
        title: const Text('Messages'),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, index) => const ListTile(
          leading: CircleAvatar(radius: 25),
          title: Text("Freelancer"),
          subtitle: Text('Hey'),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 20,
      ),
    );
  }
}
