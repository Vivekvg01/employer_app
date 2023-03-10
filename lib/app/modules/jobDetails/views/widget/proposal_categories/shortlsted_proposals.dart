import 'package:employer_app/app/modules/jobDetails/controllers/job_details_controller.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShortlistedProposal extends GetView {
  const ShortlistedProposal({super.key});

  @override
  Widget build(BuildContext context) {
    final jobdeailsController = Get.put(JobDetailsController());
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      itemBuilder: (ctx, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.kLightGrey,
            borderRadius: BorderRadius.circular(17),
          ),
          child: ListTile(
            onTap: () {
              jobdeailsController.goToProposalDetails(
                  jobdeailsController.shortListedProposalList[index].id);
            },
            title: Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Text(
                jobdeailsController.shortListedProposalList[index].cover
                    .toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  'Your Bid : ${jobdeailsController.shortListedProposalList[index].bid}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedWidth(Get.width * 0.18),
                Text(
                  'Deadline : ${jobdeailsController.shortListedProposalList[index].deadline} days',
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
      itemCount: jobdeailsController.shortListedProposalList.length,
    );
  }
}
