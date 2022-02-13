import 'package:hive_manager/home/model/user.dart';
import 'package:hive_manager/home/service/base/home_service_base.dart';
import 'package:hive_manager/home/service/home_service.dart';

class HomeRepository with HomeServiceBase {
  final HomeService _homeService;

  HomeRepository(this._homeService) : assert(_homeService != null);

  @override
  Future<User> getUser() async {
    return _homeService.getUser();
  }
}
