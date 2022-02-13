import 'package:hive/hive.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 1)
class HiveUserObject extends HiveObject {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? surname;
  @HiveField(3)
  String? userName;
  @HiveField(4)
  String? email;

  HiveUserObject(
      {this.userId, this.firstName, this.surname, this.userName, this.email});

  HiveUserObject.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    surname = json['surname'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['surname'] = surname;
    data['userName'] = userName;
    data['email'] = email;
    return data;
  }
}
