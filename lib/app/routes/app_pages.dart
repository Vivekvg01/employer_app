import 'package:get/get.dart';
import '../modules/addpost/bindings/addpost_binding.dart';
import '../modules/addpost/views/addpost_view.dart';
import '../modules/all_chats/bindings/all_chats_binding.dart';
import '../modules/all_chats/views/all_chats_view.dart';
import '../modules/auth/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/auth/forgetpassword/views/forgetpassword_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/auth/resetpassword/views/resetpassword_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/contracts/bindings/contracts_binding.dart';
import '../modules/contracts/views/contracts_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employeeDetails/bindings/employee_details_binding.dart';
import '../modules/employeeDetails/views/employee_details_view.dart';
import '../modules/findTalent/bindings/find_talent_binding.dart';
import '../modules/findTalent/views/find_talent_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jobDetails/bindings/job_details_binding.dart';
import '../modules/jobDetails/views/job_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/proposal_details/bindings/proposal_details_binding.dart';
import '../modules/proposal_details/views/proposal_details_view.dart';
import '../modules/recharge/bindings/recharge_binding.dart';
import '../modules/recharge/views/recharge_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.FIND_TALENT,
      page: () => FindTalentView(),
      binding: FindTalentBinding(),
    ),
    GetPage(
      name: _Paths.ADDPOST,
      page: () => AddpostView(),
      binding: AddpostBinding(),
    ),
    GetPage(
      name: _Paths.CONTRACTS,
      page: () => const ContractsView(),
      binding: ContractsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CHATS,
      page: () => const AllChatsView(),
      binding: AllChatsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.JOB_DETAILS,
      page: () => const JobDetailsView(),
      binding: JobDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_DETAILS,
      page: () => EmployeeDetailsView(),
      binding: EmployeeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE,
      page: () => const RechargeView(),
      binding: RechargeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.PROPOSAL_DETAILS,
      page: () => const ProposalDetailsView(),
      binding: ProposalDetailsBinding(),
    ),
  ];
}
