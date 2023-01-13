import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/proposals_controller.dart';

class ProposalsView extends GetView<ProposalsController> {
  const ProposalsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kDarkGreen,
          centerTitle: true,
          title: Text(
            'Proposals',
            style: TextStyle(color: AppColors.kWhiteColor),
          ),
          bottom: TabBar(
            tabs: [
              Text('All Proposals'),
              Text('Shortlisted(1)'),
              Text('Messaged'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("All Proposals"),
            ),
            Center(
              child: Text("Shortlisted"),
            ),
            Center(
              child: Text("Messaged"),
            ),
          ],
        ),
      ),
    );
  }
}
