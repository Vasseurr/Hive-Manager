import 'package:get/get.dart';
import 'package:hive_manager/core/constants/hive_keys.dart';
import 'package:hive_manager/core/hive_models/hive_user.dart';
import 'package:hive_manager/core/init/cache/hive_manager.dart';
import 'package:hive_manager/core/routes/app_routes.dart';
import 'package:hive_manager/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository) : assert(_repository != null);

  Future<void> saveUser(HiveUserObject hiveUserObject) async {
    hiveUserObject.userId = 1;
    //save user as key-value
    await HiveManager.instance
        .setIntValue(HiveKeys.USERID, hiveUserObject.userId!);
    await HiveManager.instance
        .setStringValue(HiveKeys.FIRSTNAME, hiveUserObject.firstName!);
    await HiveManager.instance
        .setStringValue(HiveKeys.SURNAME, hiveUserObject.surname!);
    await HiveManager.instance
        .setStringValue(HiveKeys.USERNAME, hiveUserObject.userName!);
    await HiveManager.instance
        .setStringValue(HiveKeys.EMAIL, hiveUserObject.email!);

    //save user as object
    HiveManager.instance.addUser(hiveUserObject);

    Get.toNamed(Routes.USER);
  }
}
