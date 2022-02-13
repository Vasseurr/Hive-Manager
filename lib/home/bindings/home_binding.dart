import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '/home/controller/home_controller.dart';
import '/home/repository/home_repository.dart';
import '/home/service/home_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(HomeRepository(HomeService(Dio())));
    });
  }
}
