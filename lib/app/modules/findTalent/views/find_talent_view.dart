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
    findTalendController.onInit();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kDarkGreen,
        title: const Text('Find talents'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search talents based on skills',
              border: OutlineInputBorder(),
            ),
          ),
          sizedheight(size.height * 0.02),
          ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return EmployeeTileWidget(
                employeeTitle: findTalendController
                    .employList![index]!.userTitle
                    .toString(),
                totalEarned: findTalendController
                    .employList![index]!.totalEarned
                    .toString(),
                imageUrl: findTalendController.employList?[index]?.image ??
                    defaultProfileImgae,
                emoployerId: findTalendController.employList![index]?.owner?.id ?? '',
              );
            },
            itemCount: findTalendController.employList?.length ?? 0,
            separatorBuilder: (_, __) => sizedheight(size.height * 0.02),
          ),
        ],
      ),
    );
  }
}
