// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:employer_app/app/modules/employeeDetails/models/employee_details_api.dart';
import 'package:employer_app/app/modules/findTalent/controllers/find_talent_controller.dart';

import '../api/employee_details_api.dart';

class EmployeeDetailsController extends GetxController {
  final findTalentController = Get.put(FindTalentController());

  late String empoloyeeId;

  @override
  void onInit() {
    empoloyeeId = findTalentController.employeIdVal!;
    getEmployeeDetails();
    super.onInit();
  }

  String? employeeName;
  String? employerId;
  String? userInfo;
  String? userTitle;
  List<dynamic>? completedJobs;

  void getEmployeeDetails() async {
    GetEmployeeDetails? response =
        await EmployeeDetailsApi().getAllEmpolyee(empoloyeeId);
    if (response != null) {
      if (response.owner != null) {
        if (response.owner?.name != null) {
          employeeName = response.owner!.name!;
        }
      }
      if (response.userInfo != null) {
        userInfo = response.userInfo;
      }
      if (response.userTitle != null) {
        userTitle = response.userTitle;
      }
      if (response.completedJobs != null) {
        completedJobs = response.completedJobs;
      }
    }
  }
}
