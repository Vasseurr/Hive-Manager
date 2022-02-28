# Hive Manager

Hive is a lightweight and blazing fast key-value database

## Features
- Cross platform: mobile, desktop
- Performance 
- Strong encryption built in

More details in https://pub.dev/packages/hive

## Implementation
You should add these packages into pubspec.yaml file like in the screenshot
- https://pub.dev/packages/hive
- https://pub.dev/packages/hive_flutter
- https://pub.dev/packages/hive_generator
- https://pub.dev/packages/build_runner

![s1](https://user-images.githubusercontent.com/67058617/155972904-f51593a0-c23a-4435-9bda-c5f0b1ffa527.png)

You can store values as key-value or as a hive object. If you want to store values as an object, you need to define a class that must extends HiveObject
HiveUserObject has a hive type and each variable defined as a hive field.

```
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
```

After this part, you need to start hive database in main method
```
void main() async {
  await HiveManager.preferencesInit();
  runApp(HomePage());
}
```

Run these command
flutter pub get
flutter packages pub run build_runner

After running these command, the type adapter will be created because you defined type adapter in hive object class (part 'hive_user.g.dart');
```
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserObjectAdapter extends TypeAdapter<HiveUserObject> {
  @override
  final int typeId = 1;

  @override
  HiveUserObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserObject(
      userId: fields[0] as int?,
      firstName: fields[1] as String?,
      surname: fields[2] as String?,
      userName: fields[3] as String?,
      email: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
```
In the Hive Manager, you need to give your type adapter in preferencesInit method and if you define another hive object, you need to organise methods as below
```
static preferencesInit() async {
    await Hive.initFlutter();

    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(HiveUserObjectAdapter());

    await openBox();
    return;
  }
```
```
Future<void> addUser(HiveUserObject user) async {
    await _db[1].add(user);
  }

  Future<void> updateUser(HiveUserObject user, int index) async {
    await _db[1].putAt(index, user);
  }

  HiveUserObject getUser(int index) => _db[1].getAt(index);
```
If you want to store values as key-value, you need to create a enum that include any information you want to store
```
enum HiveKeys {
  USERID,
  USERNAME,
  FIRSTNAME,
  SURNAME,
  EMAIL,
  PHONE,
}
```
How to use?
- Store as key-value
```
await HiveManager.instance.setIntValue(HiveKeys.USERID, hiveUserObject.userId!);
await HiveManager.instance.setStringValue(HiveKeys.FIRSTNAME, hiveUserObject.firstName!);
await HiveManager.instance.setStringValue(HiveKeys.SURNAME, hiveUserObject.surname!);
await HiveManager.instance.setStringValue(HiveKeys.USERNAME, hiveUserObject.userName!);
await HiveManager.instance.setStringValue(HiveKeys.EMAIL, hiveUserObject.email!);
```
- Store as an object
```
final HiveUserObject _hiveUserObject = HiveUserObject();
_hiveUserObject.userId = 0;
_hiveUserObject.firstName =  "Okan";
_hiveUserObject.surname = "Rüzgar";
_hiveUserObject.username =  "Vasseurr";
_hiveUserObject.email =  "okan.rzgr37@gmail.com";

//save user as an object
HiveManager.instance.addUser(hiveUserObject);
 ```

- Get values as key-value
```
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Text("Get User Info with key-value"),
    userField("User Id", HiveManager.instance.getIntValue(HiveKeys.USERID), context),
    userField("Username", HiveManager.instance.getStringValue(HiveKeys.USERNAME), context),
    userField("First Name", HiveManager.instance.getStringValue(HiveKeys.FIRSTNAME), context),
    userField("Surname", HiveManager.instance.getStringValue(HiveKeys.SURNAME), context),
    userField("E-mail", HiveManager.instance.getStringValue(HiveKeys.EMAIL), context),
    ],
),
```
- Get values as an object
```
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Text("Get User Info with object"),
    userField("User Id", HiveManager.instance.getUser(0).userId, context),
    userField("Username", HiveManager.instance.getUser(0).userName!, context),
    userField("First Name", HiveManager.instance.getUser(0).firstName!, context),
    userField("Surname", HiveManager.instance.getUser(0).surname!, context),
    userField("E-mail", HiveManager.instance.getUser(0).email!, context),
    ],
),
 ```
