// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/find_talent_controller.dart';

class EmployeeTileWidget extends StatelessWidget {
  EmployeeTileWidget({
    Key? key,
    required this.employeeName,
    required this.employeeTitle,
    required this.imageUrl,
    required this.emoployerId,
    required this.onBookMarkTap,
  }) : super(key: key);

  final String employeeName;
  final String employeeTitle;
  final String imageUrl;
  final String emoployerId;
  final VoidCallback onBookMarkTap;

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
            subtitle: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                employeeTitle,
              ),
            ),
            trailing: CircleAvatar(
              radius: 20,
              child: IconButton(
                onPressed: onBookMarkTap,
                icon: const Icon(Icons.bookmark_outline, size: 20),
              ),
            ),
            onTap: () {
              findTalentController.gotoEmployerDetailsPage(emoployerId);
            },
          ),
        ],
      ),
    );
  }
}
