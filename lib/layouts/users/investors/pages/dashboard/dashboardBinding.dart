import 'package:get/get.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/accountController.dart';
import 'package:pitchbox/layouts/users/investors/pages/home/homeController.dart';

import 'dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
