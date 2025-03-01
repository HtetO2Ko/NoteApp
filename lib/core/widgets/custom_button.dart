import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:note_app/core/configs/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTxt;
  final bool buttonLoading;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonTxt,
    required this.buttonLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: buttonLoading
              ? SpinKitRing(
                  color: theme.primaryColor,
                  size: 30,
                  lineWidth: 4,
                )
              : Text(
                  buttonTxt,
                  style: TextStyle(
                    color: theme.primaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}
