import 'package:employer_app/app/modules/contracts/views/contracts_view.dart';
import 'package:employer_app/app/modules/findTalent/views/find_talent_view.dart';
import 'package:employer_app/app/modules/proposals/views/proposals_view.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/addpost/views/addpost_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                const FindTalentView(),
                const AddpostView(),
                const ProposalsView(),
                const ContractsView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: primaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
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
                label: '',
                icon: Icons.add,
              ),
              bottomNavigationBarItem(
                icon: Icons.file_copy_outlined,
                label: 'PROPOSAL',
              ),
              bottomNavigationBarItem(
                icon: Icons.library_books_outlined,
                label: 'Contracts',
              ),
            ],
          ),
          floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(AddpostView());
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
