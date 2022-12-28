import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/find_talent_controller.dart';

class FindTalentView extends GetView<FindTalentController> {
  const FindTalentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FindTalentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: TextField(),
      ),
    );
  }
}
