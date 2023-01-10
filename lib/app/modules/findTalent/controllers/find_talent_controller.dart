import 'package:employer_app/app/modules/findTalent/api/get_all_employee_api.dart';
import 'package:employer_app/app/modules/findTalent/models/all_employees/all_employees_model.dart';
import 'package:get/get.dart';

import '../models/all_employees/employee_model.dart';

class FindTalentController extends GetxController {
  @override
  void onInit() {
    getEmployeeDatas();
    super.onInit();
  }

  List<AllEmplyee?>? employList = [];

  void getEmployeeDatas() async {
    GetAllEmployee? response = await GetAlllEmployeeApi().getAllEmpolyees();

    if (response != null) {
      if (response.allEmplyees != null) {
        employList = response.allEmplyees;
      }
    }
  }
}
