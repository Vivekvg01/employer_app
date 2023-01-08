import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../controllers/contracts_controller.dart';

class ContractsView extends GetView<ContractsController> {
  const ContractsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kDarkGreen,
          title: const Text('Contracts'),
        ),
        body: Column());
  }
}
