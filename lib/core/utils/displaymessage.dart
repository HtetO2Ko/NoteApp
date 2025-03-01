import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/app.dart';

class DisplayMessage {
  static void showSnackBar(String msg, bool isSuccess) {
    FToast fToast = FToast();
    fToast = fToast.init(navigatorKey.currentContext!);
    return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: isSuccess
              ? const Color.fromRGBO(43, 198, 22, 50)
              : !isSuccess
                  ? Colors.red
                  : Colors.black,
        ),
        child: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child, gravity) {
        return Positioned(
          left: 50.0,
          right: 50.0,
          bottom: 60.0,
          child: child,
        );
      },
    );
  }
}
