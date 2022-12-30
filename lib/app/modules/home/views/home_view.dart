import 'package:employer_app/app/modules/all_chats/views/all_chats_view.dart';
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
            color: primaryColor,
          ),
        ),
        backgroundColor: kdarkGreen,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kWhiteColor,
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
        ],
      ),
      body: SafeArea(
        child: homeController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Java Developer',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          sizedheight(10),
                          const Text(
                            'status: active',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          sizedheight(10),
                          const Text(
                            'Proposals: 0',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 10,
              ),
      ),
    );
  }
}
