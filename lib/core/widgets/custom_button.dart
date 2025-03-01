import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
          color: Color(0xFFFFB22C),
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
