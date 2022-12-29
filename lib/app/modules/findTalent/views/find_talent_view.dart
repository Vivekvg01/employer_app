import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/find_talent_controller.dart';

class FindTalentView extends GetView<FindTalentController> {
  FindTalentView({Key? key}) : super(key: key);

  final _findTalendController = Get.put(FindTalentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindTalentView'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              _findTalendController.logout(); 
            },
            icon: const Icon(Icons.logout),
            label: const Text("Log out"),
          ),
        ],
      ),
    );
  }
}
