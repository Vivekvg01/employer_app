import 'package:employer_app/app/modules/findTalent/views/widgets/employee_tile_widget.dart';
import 'package:employer_app/app/modules/findTalent/views/widgets/search_widget.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:employer_app/app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/find_talent_controller.dart';

class FindTalentView extends GetView<FindTalentController> {
  FindTalentView({Key? key}) : super(key: key);

  final findTalendController = Get.put(FindTalentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Find talents'),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: FindTalendsSearch(),
              // );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Obx(
        () => findTalendController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return EmployeeTileWidget(
                        employeeName: findTalendController
                                .employList?[index]?.owner?.name
                                .toString() ??
                            '',
                        employeeTitle: findTalendController
                                .employList?[index]?.userTitle
                                .toString() ??
                            'No title',
                        imageUrl:
                            findTalendController.employList?[index]?.image ??
                                defaultProfileImgae,
                        emoployerId: findTalendController
                                .employList![index]?.owner?.id ??
                            '',
                        onBookMarkTap: () {
                          findTalendController.onSaveButtonClicked();
                        },
                      );
                    },
                    itemCount: findTalendController.employList?.length ?? 0,
                    separatorBuilder: (_, __) =>
                        sizedheight(size.height * 0.02),
                  ),
                ],
              ),
      ),
    );
  }
}
