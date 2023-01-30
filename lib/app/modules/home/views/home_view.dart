import 'package:employer_app/app/modules/addpost/views/addpost_view.dart';
import 'package:employer_app/app/modules/home/views/widgets/job_category_chip.dart';
import 'package:employer_app/app/modules/home/views/widgets/my_job_tile_widget.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'GET WORKER',
          style: TextStyle(
            color: AppColors.kGreenColor,
          ),
        ),
        backgroundColor: AppColors.kDarkGreen,
        actions: [
          IconButton(
            tooltip: "Add post",
            onPressed: () {
              Get.to(() => AddpostView());
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.kWhiteColor,
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          IconButton(
            onPressed: () {
              homeController.gotToChat();
            },
            icon: const Icon(Icons.message),
          ),
          IconButton(
            onPressed: () {
              homeController.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GetX<HomeController>(
        init: homeController..onInit(),
        builder: (context) {
          return SafeArea(
            child: homeController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: JobCategoryChip(),
                      ),
                      homeController.tabIndex.value == 0
                          ? ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(15),
                              itemBuilder: (context, index) {
                                return MyJobsTileWidget(
                                  title: homeController
                                          .activeJobList[index].title ??
                                      '',
                                  status: homeController
                                          .activeJobList[index].status ??
                                      '',
                                  proposalLength: homeController
                                          .activeJobList[index]
                                          .proposals
                                          ?.length
                                          .toString() ??
                                      '0',
                                  description: homeController
                                          .activeJobList[index].description ??
                                      '',
                                  jobId:
                                      homeController.activeJobList[index].id ??
                                          '',
                                  budget: homeController
                                      .activeJobList[index].budget
                                      .toString(),
                                );
                              },
                              separatorBuilder: (_, __) =>
                                  sizedheight(Get.height * 0.02),
                              itemCount: homeController.activeJobList.length,
                            )
                          //on going jobs
                          : homeController.tabIndex.value == 1
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  padding: const EdgeInsets.all(15),
                                  itemBuilder: (context, index) {
                                    return MyJobsTileWidget(
                                      title: homeController
                                              .onGoingJobList[index].title ??
                                          '',
                                      status: homeController
                                              .onGoingJobList[index].status ??
                                          '',
                                      proposalLength: homeController
                                              .onGoingJobList[index]
                                              .proposals
                                              ?.length
                                              .toString() ??
                                          '0',
                                      description: homeController
                                              .onGoingJobList[index]
                                              .description ??
                                          '',
                                      jobId: homeController
                                              .onGoingJobList[index].id ??
                                          '',
                                      budget: homeController
                                          .onGoingJobList[index].budget
                                          .toString(),
                                    );
                                  },
                                  separatorBuilder: (_, __) =>
                                      sizedheight(Get.height * 0.02),
                                  itemCount:
                                      homeController.onGoingJobList.length,
                                )
                              //completed jobs
                              : homeController.tabIndex.value == 2
                                  ? ListView.separated(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      padding: const EdgeInsets.all(15),
                                      itemBuilder: (context, index) {
                                        return MyJobsTileWidget(
                                          title: homeController
                                                  .completedJobList[index]
                                                  .title ??
                                              '',
                                          status: homeController
                                                  .completedJobList[index]
                                                  .status ??
                                              '',
                                          proposalLength: homeController
                                                  .completedJobList[index]
                                                  .proposals
                                                  ?.length
                                                  .toString() ??
                                              '0',
                                          description: homeController
                                                  .completedJobList[index]
                                                  .description ??
                                              '',
                                          jobId: homeController
                                                  .completedJobList[index].id ??
                                              '',
                                          budget: homeController
                                              .completedJobList[index].budget
                                              .toString(),
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          sizedheight(Get.height * 0.02),
                                      itemCount: homeController
                                          .completedJobList.length,
                                    )
                                  //cancelled jobs
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      padding: const EdgeInsets.all(15),
                                      itemBuilder: (context, index) {
                                        return MyJobsTileWidget(
                                          title: homeController
                                                  .cancelledJobList[index]
                                                  .title ??
                                              '',
                                          status: homeController
                                                  .cancelledJobList[index]
                                                  .status ??
                                              '',
                                          proposalLength: homeController
                                                  .cancelledJobList[index]
                                                  .proposals
                                                  ?.length
                                                  .toString() ??
                                              '0',
                                          description: homeController
                                                  .cancelledJobList[index]
                                                  .description ??
                                              '',
                                          jobId: homeController
                                                  .cancelledJobList[index].id ??
                                              '',
                                          budget: homeController
                                              .cancelledJobList[index].budget
                                              .toString(),
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          sizedheight(Get.height * 0.02),
                                      itemCount: homeController
                                          .cancelledJobList.length,
                                    )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
