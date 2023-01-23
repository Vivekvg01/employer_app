import 'dart:async';

import 'package:employer_app/app/modules/employeeDetails/views/employee_details_view.dart';
import 'package:employer_app/app/modules/findTalent/api/get_all_employee_api.dart';
import 'package:employer_app/app/modules/findTalent/models/all_employees/all_employees_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/all_employees/employee_model.dart';

class FindTalentController extends GetxController {
  @override
  void onInit() {
    getEmployeeDatas();
    super.onInit();
  }

  //textfeild controllers
  final TextEditingController searchTextController = TextEditingController();
  final Rx<TextEditingController> searchController =
      TextEditingController().obs;
  final FocusNode searchFocusNode = FocusNode();

  //string values
  String? employeIdVal;

  //boolean values
  RxBool isSaved = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSearching = false.obs;

  //Lists
  RxList<AllEmployee?>? employeeList = <AllEmployee?>[].obs;
  RxList<AllEmployee?>? employeeSearchResultList = <AllEmployee?>[].obs;

  void getEmployeeDatas() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    GetAllEmployee? response = await GetAllEmployeeApi().getAllEmpolyees();

    if (response != null) {
      if (response.allEmplyees != null) {
        employeeList?.value = response.allEmplyees!;
      }
    }
    isLoading(false);
  }

  void searchTalends(query) async {
    GetAllEmployee? response = await GetAllEmployeeApi().searchEmployee(query);
    if (response != null) {
      if (response.allEmplyees != null) {
        employeeSearchResultList?.value = response.allEmplyees!;
      }
    }
  }

  void gotoEmployerDetailsPage(String? employeeId) {
    if (employeeId != null) {
      employeIdVal = employeeId;
      Get.to(
        () => EmployeeDetailsView(),
      );
    }
  }
}
