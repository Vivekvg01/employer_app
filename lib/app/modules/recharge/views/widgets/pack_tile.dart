import 'package:employer_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PackTileWidget extends StatelessWidget {
  const PackTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.kDarkGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Pack',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kWhiteColor,
                fontSize: 23,
              ),
            ),
            Text(
              'Recharge for Rs :500.00',
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: size.width * 0.98,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
