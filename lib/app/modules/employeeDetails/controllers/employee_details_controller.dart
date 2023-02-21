import 'package:get/get.dart';
import 'package:employer_app/app/modules/employeeDetails/models/employee_details_api.dart';
import '../api/employee_details_api.dart';

class EmployeeDetailsController extends GetxController {
 
 String employeeId = Get.arguments;

  @override
  void onInit() {
    print(employeeId);
    getEmployeeDetails();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  String? employeeName;
  String? employerId;
  String? userInfo;
  String? userTitle;
  String? imageUrl;
  num? totalEarnings;
  RxList<dynamic>? completedJobs = [].obs;

  RxList<Skill?> skillsList = <Skill?>[].obs;
  RxList<Education?> educationList = <Education?>[].obs;
  RxList<Language?> languageList = <Language?>[].obs;
  RxList<Portfolio?>? portFolios = <Portfolio?>[].obs;

  Future<void> getEmployeeDetails() async {
    isLoading(true);
    GetEmployeeDetails? response =
        await EmployeeDetailsApi().getEmployeeDetails(employeeId);
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
        completedJobs?.value = response.completedJobs!;
      }
      if (response.image != null) {
        imageUrl = response.image;
      }
      if (response.totalEarned != null) {
        totalEarnings = response.totalEarned;
      }
      if (response.skills != null) {
        skillsList.value = response.skills!;
      }
      if (response.educations != null) {
        educationList.value = response.educations ?? [];
      }
      if (response.languages != null) {
        languageList.value = response.languages ?? [];
      }
      if (response.portfolios != null) {
        portFolios?.value = response.portfolios ?? [];
      }
    }
    isLoading(false);
  }
}
