import 'package:flutter/material.dart';

class AppNavigator {
  static void pop(BuildContext context, {dynamic value}) {
    Navigator.pop(context, value);
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static Future<dynamic> push(BuildContext context, Widget widget) async {
    var returnValue = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
    if (returnValue != null) {
      return returnValue;
    }
    return "null";
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }
}
