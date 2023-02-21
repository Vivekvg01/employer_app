import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/find_talent_controller.dart';

class EmployeeTileWidget extends GetView {
  const EmployeeTileWidget({
    Key? key,
    required this.employeeName,
    required this.employeeTitle,
    required this.imageUrl,
    required this.employeeId,
  }) : super(key: key);

  final String employeeName;
  final String employeeTitle;
  final String imageUrl;
  final String employeeId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
            title: Text(
              employeeName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            subtitle: Text(
              employeeTitle,
            ),
            // trailing: IconButton(
            //   onPressed: () {
            //  //  Get.find<FindTalentController>().onSaveTalendButtonClick(employeeId);
            //   },
            //   icon: const CircleAvatar(
            //     radius: 20,
            //     child: Icon(
            //       Icons.bookmark_outline,
            //       size: 20,
            //     ),
            //   ),
            // ),
            onTap: () {
              Get.find<FindTalentController>()
                  .gotoEmployerDetailsPage(employeeId);
            },
          ),
        ],
      ),
    );
  }
}
