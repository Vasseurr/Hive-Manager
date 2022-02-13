// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_manager/core/components/buttons/custom_button.dart';
import 'package:hive_manager/core/components/text/text_form_field.dart';
import 'package:hive_manager/core/components/widgets/custom_scaffold.dart';
import 'package:hive_manager/core/extension/context_extension.dart';
import 'package:hive_manager/core/hive_models/hive_user.dart';
import 'package:hive_manager/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final HiveUserObject _hiveUserObject = HiveUserObject();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        margin: EdgeInsets.all(context.mediumHeightValue),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                VasseurrTFF(
                  labelText: "First Name",
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _hiveUserObject.firstName = value,
                ),
                SizedBox(height: context.height * 0.03),
                VasseurrTFF(
                  labelText: "Surname",
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _hiveUserObject.surname = value,
                ),
                SizedBox(height: context.height * 0.03),
                VasseurrTFF(
                  labelText: "Username",
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _hiveUserObject.userName = value,
                ),
                SizedBox(height: context.height * 0.03),
                VasseurrTFF(
                  labelText: "E-mail",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) => _hiveUserObject.email = value,
                ),
                SizedBox(height: context.height * 0.1),
                VasseurrBttn(
                    width: context.width * 0.8,
                    buttonText: "Kaydet",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _hiveUserObject.userId = 0;
                        await Get.find<HomeController>()
                            .saveUser(_hiveUserObject);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
