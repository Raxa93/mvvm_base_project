
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtilities {
  static showToast(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }

  // showMessage(BuildContext context, String title, String message) {
  //   return Flushbar(
  //     title: title,
  //     message: message,
  //     duration: const Duration(seconds: 3),
  //     backgroundGradient: const LinearGradient(colors: [
  //       Color(0xffFFA37C),
  //       Color(0xffFE7940),
  //       Color(0xffFF9A70),
  //     ]),
  //   )..show(context);
  // }
}
