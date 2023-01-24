import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class DataCountWidget extends StatelessWidget {
  const DataCountWidget({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.35,
      decoration: BoxDecoration(
        color: AppColors.kDarkGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          sizedheight(size.height * 0.01),
          Text(
            count.toString(),
            style: TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
