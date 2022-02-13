import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_manager/core/components/widgets/custom_scaffold.dart';
import 'package:hive_manager/core/constants/hive_keys.dart';
import 'package:hive_manager/core/init/cache/hive_manager.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var groupValue = "object";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: context.height * 0.05,
          left: context.width * 0.05,
          right: context.width * 0.05),
      child: Column(
        children: [
          _radioButtons(context),
          groupValue == "object"
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Get User Info with object"),
                    userField("User Id", HiveManager.instance.getUser(0).userId,
                        context),
                    userField("Username",
                        HiveManager.instance.getUser(0).userName!, context),
                    userField("First Name",
                        HiveManager.instance.getUser(0).firstName!, context),
                    userField("Surname",
                        HiveManager.instance.getUser(0).surname!, context),
                    userField("E-mail", HiveManager.instance.getUser(0).email!,
                        context),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Get User Info with key-value"),
                    userField(
                        "User Id",
                        HiveManager.instance.getIntValue(HiveKeys.USERID),
                        context),
                    userField(
                        "Username",
                        HiveManager.instance.getStringValue(HiveKeys.USERNAME),
                        context),
                    userField(
                        "First Name",
                        HiveManager.instance.getStringValue(HiveKeys.FIRSTNAME),
                        context),
                    userField(
                        "Surname",
                        HiveManager.instance.getStringValue(HiveKeys.SURNAME),
                        context),
                    userField(
                        "E-mail",
                        HiveManager.instance.getStringValue(HiveKeys.EMAIL),
                        context),
                  ],
                ),
        ],
      ),
    ));
  }

  SizedBox _radioButtons(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      width: context.width,
      child: Column(
        children: [
          ListTile(
            title: const Text("Get User Info with object"),
            leading: Radio(
              value: "object",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = "object";
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Get User Info with key-value"),
            leading: Radio(
              value: "key-value",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = "key-value";
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container userField<T>(String title, T value, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: context.height * 0.03, bottom: context.height * 0.02),
      width: context.width * 0.6,
      height: context.height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(child: Text(title)),
          Flexible(child: Text(value.toString()))
        ],
      ),
    );
  }
}
