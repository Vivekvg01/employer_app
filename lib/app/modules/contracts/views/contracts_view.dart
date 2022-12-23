import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contracts_controller.dart';

class ContractsView extends GetView<ContractsController> {
  const ContractsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContractsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContractsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
