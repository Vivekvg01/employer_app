import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseHistryBottomSheet extends StatelessWidget {
  const PurchaseHistryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.kWhiteColor,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          const Text(
            'PURCHASE HISTORY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
