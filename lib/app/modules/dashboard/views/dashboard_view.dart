import 'package:employer_app/app/modules/addpost/views/addpost_view.dart';
import 'package:employer_app/app/modules/findTalent/views/find_talent_view.dart';
import 'package:employer_app/app/modules/profile/views/profile_view.dart';
import 'package:employer_app/app/modules/recharge/views/recharge_view.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                FindTalentView(),
                AddpostView(),
                RechargeView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: AppColors.kWhiteColor,
            selectedItemColor: AppColors.kGreenColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.kDarkGreen,
            elevation: 0,
            selectedFontSize: 10,
            unselectedFontSize: 11,
            items: [
              bottomNavigationBarItem(
                icon: Icons.home,
                label: 'HOME',
              ),
              bottomNavigationBarItem(
                icon: Icons.search,
                label: 'FIND TALENT',
              ),
              bottomNavigationBarItem(
                icon: Icons.add,
                label: '',
              ),
              bottomNavigationBarItem(
                icon: Icons.currency_rupee,
                label: 'RECHARGE',
              ),
              bottomNavigationBarItem(
                icon: Icons.person,
                label: 'PROFILE',
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 70.0,
              width: 70.0,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => AddpostView());
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
        );
      },
    );
  }

  bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 20),
      label: label,
    );
  }
}
