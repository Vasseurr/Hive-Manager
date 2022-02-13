// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_manager/core/extension/context_extension.dart';

import 'custom_button.dart';

class Google extends StatelessWidget {
  const Google({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VasseurrBttn(
      height: context.getHeight * 0.05,
      width: context.getWidth * 0.35,
      buttonText: "Google",
      onPressed: () {
        //sign in with Google
      },
      buttonColor: Color.fromRGBO(207, 67, 50, 1),
      borderColor: Color.fromRGBO(207, 67, 50, 1),
      buttonIcon: Image.asset(
        "assets/images/google.png",
        //   width: context.getWidth * 0.05,
        //   height: context.getHeight * 0.1,
      ),
    );
  }
}
