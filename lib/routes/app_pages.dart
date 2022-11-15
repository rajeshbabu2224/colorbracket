import 'package:get/get.dart';

import '../modules/employee_details/bindings/employeedetails_binding.dart';
import '../modules/employee_details/views/employeedetails_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../viewmore/bindings/viewmore_binding.dart';
import '../viewmore/views/viewmore_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
      name: _Paths.EMPDETAILS,
      page: () => EmployeeDetailsView(),
      binding: EmployeeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.VIEWMORE,
      page: () => ViewMoreView(),
      binding: ViewMoreBinding(),
    ),
  ];
}
