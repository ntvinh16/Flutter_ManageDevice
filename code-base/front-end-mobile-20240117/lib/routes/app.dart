import 'package:front_end_mobile_20240117/features/binding/detail_binding.dart';
import 'package:front_end_mobile_20240117/features/binding/home_binding.dart';
import 'package:front_end_mobile_20240117/features/binding/login_binding.dart';
import 'package:front_end_mobile_20240117/features/page/detail_page.dart';
import 'package:front_end_mobile_20240117/features/page/home_page.dart';
import 'package:front_end_mobile_20240117/features/page/login_page.dart';
import 'package:front_end_mobile_20240117/features/page/signup_page.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

import '../features/binding/signup_binding.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: AppRoutes.DETAIL_PAGE,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP_PAGE,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
