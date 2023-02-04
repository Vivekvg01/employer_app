// import 'package:employer_app/app/modules/jobDetails/model/proposal_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../jobDetails/controllers/job_details_controller.dart';

// class ProposalsController extends GetxController
//     with GetTickerProviderStateMixin {
//   RxList<Proposal> allProposalList = <Proposal>[].obs;
//   late TabController tabController;

//   @override
//   void onInit() {
//     tabController = TabController(length: 3, vsync: this);
//     allProposalList = Get.find<JobDetailsController>().porposalList;
//     super.onInit();
//   }

//   final List<Tab> tabs = [
//     const Tab(text: "All Proposals"),
//     const Tab(text: "Shortlisted"),
//     const Tab(text: "Messaged"),
//   ];
// }
