import 'package:get/get.dart';
import 'package:pitchbox/layouts/users/investors/pages/dashboard/dashboardBinding.dart';
import 'package:pitchbox/layouts/users/investors/pages/dashboard/dashboardPage.dart';

import 'appRoutes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
