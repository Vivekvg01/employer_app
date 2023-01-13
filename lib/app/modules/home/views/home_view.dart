import 'package:employer_app/app/modules/addpost/views/addpost_view.dart';
import 'package:employer_app/app/modules/all_chats/views/all_chats_view.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'GET WORKER',
          style: TextStyle(
            color: AppColors.primaryColor,
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
              Get.to(const AllChatsView());
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
                  : ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        return MyJobsTileWidget(
                          title: homeController.myJobsList[index].title ?? '',
                          status: homeController.myJobsList[index].status ?? '',
                          proposalLength: homeController
                                  .myJobsList[index].proposals?.length
                                  .toString() ??
                              '0',
                          description:
                              homeController.myJobsList[index].description ??
                                  '',
                          jobId: homeController.myJobsList[index].id ?? '',
                        );
                      },
                      separatorBuilder: (_, __) =>
                          sizedheight(size.height * 0.02),
                      itemCount: homeController.myJobsList.length,
                    ),
            );
          }),
    );
  }
}
