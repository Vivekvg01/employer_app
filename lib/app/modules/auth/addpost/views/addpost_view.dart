import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addpost_controller.dart';

class AddpostView extends GetView<AddpostController> {
  const AddpostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddpostView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddpostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
