import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static showErrorDilog({required BuildContext context, required String msg}) {
    return showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(msg,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: color ?? const Color(0x73635252),
        gravity: gravity ?? ToastGravity.BOTTOM);
  }
}
