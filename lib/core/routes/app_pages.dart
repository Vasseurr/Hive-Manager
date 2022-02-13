import 'package:get/get.dart';
import 'package:hive_manager/home/bindings/home_binding.dart';
import 'package:hive_manager/home/ui/home_page.dart';
import 'package:hive_manager/home/ui/user_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
        name: Routes.USER,
        page: () => const UserPage(),
        binding: HomeBinding()),
  ];
}
