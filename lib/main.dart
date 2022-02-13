import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_manager/home/bindings/home_binding.dart';
import 'core/init/cache/hive_manager.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await HiveManager.preferencesInit();
  //await Hive.initFlutter();
  runApp(GetMaterialApp(
    initialBinding: HomeBinding(),
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    //theme: AppThemeLight.instance.theme,
    getPages: AppPages.pages,
  ));
}
