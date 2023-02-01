import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/proposal_details_controller.dart';

class ProposalDetailsView extends GetView<ProposalDetailsController> {
  const ProposalDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProposalDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProposalDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
