import 'dart:convert';

import 'package:hive_manager/core/init/cache/hive_manager.dart';
import 'package:hive_manager/home/model/user.dart';

import 'base/home_service_base.dart';

class HomeService with HomeServiceBase {
  // final http.Client httpClient;

  @override
  Future<User> getUser() async {
    User user = User();
    user.name = HiveManager.instance.getUser(0).userName;
    return user;
  }
}
