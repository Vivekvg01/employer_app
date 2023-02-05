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

  void getEmployeeDetails() async {
    isLoading(true);
    GetEmployeeDetails? response =
        await EmployeeDetailsApi().getEmployeeDetails(empoloyeeId);
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
