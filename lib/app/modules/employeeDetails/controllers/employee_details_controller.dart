import 'package:employer_app/app/modules/employeeDetails/models/employee_details_api.dart';
import 'package:employer_app/app/modules/findTalent/models/all_employees/all_employees_model.dart';
import 'package:get/get.dart';
import '../api/employee_details_api.dart';

class EmployeeDetailsController extends GetxController {
  @override
  void onInit() {
    getEmployeeDetails();
    super.onInit();
  }

  void getEmployeeDetails() async {
    GetEmployeeDetails? response = await EmployeeDetailsApi().getAllEmpolyee();
  }
}
