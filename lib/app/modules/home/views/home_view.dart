import 'package:employer_app/app/modules/all_chats/views/all_chats_view.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'GET WORKER',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        backgroundColor: kdarkGreen,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kWhiteColor,
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(AllChatsView());
            },
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home View"),
      ),
    );
  }
}
