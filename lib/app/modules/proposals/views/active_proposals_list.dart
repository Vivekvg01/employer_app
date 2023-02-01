import 'package:employer_app/app/modules/proposals/controllers/proposals_controller.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivePropsals extends GetView {
  const ActivePropsals({super.key});

  @override
  Widget build(BuildContext context) {
    final proposalController = Get.put(ProposalsController());
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (ctx, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.kLightGrey,
            borderRadius: BorderRadius.circular(17),
          ),
          child: ListTile(
            onTap: () {},
            title: Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Text(
                proposalController.allProposalList[index].cover.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  'Your Bid : ${proposalController.allProposalList[index].bid}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedWidth(Get.width * 0.3),
                Text(
                  'Deadline : ${proposalController.allProposalList[index].deadline} days',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return sizedheight(Get.height * 0.02);
      },
      itemCount: proposalController.allProposalList.length,
    );
  }
}
