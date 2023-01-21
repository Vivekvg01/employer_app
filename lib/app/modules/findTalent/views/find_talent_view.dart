import 'package:employer_app/app/modules/findTalent/views/widgets/employee_tile_widget.dart';
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
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kDarkGreen,
          titleSpacing: 0.0,
          leading: findTalendController.isSearching.value
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    findTalendController.isSearching.value = false;
                    findTalendController.searchFocusNode.unfocus();
                  },
                )
              : Container(),
          title: findTalendController.isSearching.value
              ? TextField(
                  controller: findTalendController.searchController,
                  focusNode: findTalendController.searchFocusNode,
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  autofocus: true,
                )
              : Transform(
                  transform: Matrix4.translationValues(-25.0, 0.0, 0.0),
                  child: const Text('Find Talent')),
          actions: findTalendController.isSearching.value
              ? <Widget>[
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      findTalendController.isSearching.value = false;
                      findTalendController.searchFocusNode.unfocus();
                    },
                  ),
                ]
              : <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      findTalendController.isSearching.value = true;
                      findTalendController.searchFocusNode.requestFocus();
                    },
                  ),
                ],
        ),
        body: findTalendController.isLoading.value
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
                                .employeeList?[index]?.owner?.name
                                .toString() ??
                            '',
                        employeeTitle: findTalendController
                                .employeeList?[index]?.userTitle
                                .toString() ??
                            'No title',
                        imageUrl:
                            findTalendController.employeeList?[index]?.image ??
                                defaultProfileImgae,
                        emoployerId: findTalendController
                                .employeeList![index]?.owner?.id ??
                            '',
                        onBookMarkTap: () {
                          findTalendController.onSaveButtonClicked();
                        },
                      );
                    },
                    itemCount: findTalendController.employeeList?.length ?? 0,
                    separatorBuilder: (_, __) =>
                        sizedheight(size.height * 0.02),
                  ),
                ],
              ),
      ),
    );
  }
}
