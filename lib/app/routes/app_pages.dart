import 'package:get/get.dart';

import '../modules/addpost/bindings/addpost_binding.dart';
import '../modules/addpost/views/addpost_view.dart';
import '../modules/contracts/bindings/contracts_binding.dart';
import '../modules/contracts/views/contracts_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/findTalent/bindings/find_talent_binding.dart';
import '../modules/findTalent/views/find_talent_view.dart';
import '../modules/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/forgetpassword/views/forgetpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/proposals/bindings/proposals_binding.dart';
import '../modules/proposals/views/proposals_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.FIND_TALENT,
      page: () => const FindTalentView(),
      binding: FindTalentBinding(),
    ),
    GetPage(
      name: _Paths.ADDPOST,
      page: () => const AddpostView(),
      binding: AddpostBinding(),
    ),
    GetPage(
      name: _Paths.PROPOSALS,
      page: () => const ProposalsView(),
      binding: ProposalsBinding(),
    ),
    GetPage(
      name: _Paths.CONTRACTS,
      page: () => const ContractsView(),
      binding: ContractsBinding(),
    ),
  ];
}
