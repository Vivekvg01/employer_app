import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class JobCategoryChip extends StatelessWidget {
  const JobCategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ChoiceChip(
            label: Text(
              'Active Jobs',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            selected: true,
            selectedColor: AppColors.kBlackColor,
          ),
          const ChoiceChip(
            label: Text('On Going Jobs'),
            selected: false,
          ),
          const ChoiceChip(
            label: Text('Completed jobs'),
            selected: false,
          ),
          const ChoiceChip(
            label: Text('Canceled Jobs'),
            selected: false,
          ),
        ],
      ),
    );
  }
}
