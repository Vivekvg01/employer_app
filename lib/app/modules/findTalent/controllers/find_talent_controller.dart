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
    //getSearchResult();
    super.onInit();
  }

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  String? employeIdVal;

  RxBool isSaved = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSearching = false.obs;

  void onSaveButtonClicked() {}

  RxList<AllEmplyee?>? employeeList = <AllEmplyee?>[].obs;

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

  void gotoEmployerDetailsPage(String? employeeId) {
    if (employeeId != null) {
      employeIdVal = employeeId;
      Get.to(
        () => EmployeeDetailsView(),
      );
    }
  }
}
