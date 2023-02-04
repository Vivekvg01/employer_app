// import 'package:employer_app/app/modules/proposals/views/active_proposals_list.dart';
// import 'package:employer_app/app/modules/proposals/views/messaged_proposal.dart';
// import 'package:employer_app/app/modules/proposals/views/short_listed_propsals.dart';
// import 'package:employer_app/app/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/proposals_controller.dart';

// class ProposalsView extends GetView<ProposalsController> {
//   ProposalsView({Key? key}) : super(key: key);

//   final proposalController = Get.put(ProposalsController());

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: AppColors.kDarkGreen,
//           centerTitle: true,
//           title: Text(
//             'Proposals',
//             style: TextStyle(color: AppColors.kWhiteColor),
//           ),
//           bottom: TabBar(
//             tabs: proposalController.tabs,
//           ),
//         ),
//         body: TabBarView(
//           controller: proposalController.tabController,
//           children: const [
//             AllPropsals(),
//             ShortListedProposal(),
//             MessagedProposal(),
//           ],
//         ),
//       ),
//     );
//   }
// }
