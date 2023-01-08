import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/proposals_controller.dart';

class ProposalsView extends GetView<ProposalsController> {
  const ProposalsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.kBlackColor,
        ),
        backgroundColor: AppColors.kDarkGreen,
        title: Text(
          'Proposals',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
