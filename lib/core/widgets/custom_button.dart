import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:note_app/core/configs/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTxt;
  final bool buttonLoading;
  final Color? color;
  final Color? txtColor;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonTxt,
    required this.buttonLoading,
    this.color,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color ?? AppColor.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: buttonLoading
              ? SpinKitRing(
                  color: txtColor ?? theme.primaryColor,
                  size: 30,
                  lineWidth: 4,
                )
              : Text(
                  buttonTxt,
                  style: TextStyle(
                    color: txtColor ?? theme.primaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}
