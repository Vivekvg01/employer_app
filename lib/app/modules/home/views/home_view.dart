import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              homeController.logout();
            },
            icon: const Icon(Icons.logout),
            label: const Text("Log out"),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home View"),
      ),
    );
  }
}
