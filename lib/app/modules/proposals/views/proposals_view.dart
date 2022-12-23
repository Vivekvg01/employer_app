import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/proposals_controller.dart';

class ProposalsView extends GetView<ProposalsController> {
  const ProposalsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProposalsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProposalsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
