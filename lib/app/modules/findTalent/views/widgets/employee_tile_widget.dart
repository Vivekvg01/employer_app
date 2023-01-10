// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:employer_app/app/modules/employerDetails/views/employer_details_view.dart';

import '../../controllers/find_talent_controller.dart';

class EmployeeTileWidget extends StatelessWidget {
  EmployeeTileWidget({
    Key? key,
    required this.employeeTitle,
    required this.totalEarned,
    required this.imageUrl,
  }) : super(key: key);

  final String employeeTitle;
  final String totalEarned;
  final String imageUrl;

  final findTalentController = Get.put(FindTalentController());

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
              backgroundImage: NetworkImage(
                findTalentController.employList![0]!.image.toString(),
              ),
              radius: 30,
            ),
            title: Text(
              employeeTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'total earned : $totalEarned',
              ),
            ),
            trailing: const CircleAvatar(
              radius: 20,
              child: Icon(Icons.bookmark_outline, size: 20),
            ),
            onTap: () {
              Get.to(() => const EmployeeDetails());
            },
          ),
        ],
      ),
    );
  }
}
