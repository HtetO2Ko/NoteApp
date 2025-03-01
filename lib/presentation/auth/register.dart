import 'package:flutter/material.dart';
import 'package:note_app/core/configs/assets/app_vector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/presentation/auth/login.dart';
import 'package:note_app/presentation/auth/notifier/register_notifier.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      AppVector.authLogo,
                      width: 100,
                      height: 200,
                    ),
                  ),
                  _spacing(),
                  _emailTextField(context, theme),
                  _spacing(),
                  _passwordTextField(context, theme),
                  _spacing(),
                  _register(context),
                  _login(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField(BuildContext context, ThemeData theme) {
    final read = context.read<RegisterNotifier>();
    return TextField(
      controller: read.emailCtr,
      decoration: InputDecoration(
        label: Text("Email"),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context, ThemeData theme) {
    final read = context.read<RegisterNotifier>();
    final watch = context.read<RegisterNotifier>();
    return TextField(
      controller: read.pswCtr,
      obscureText: read.isVisibility,
      decoration: InputDecoration(
        label: Text("Password"),
        suffix: GestureDetector(
          onTap: () => read.changeVisibility(),
          child: Icon(
            watch.isVisibility ? Icons.visibility : Icons.visibility_off,
            color: theme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _register(BuildContext context) {
    final read = context.read<RegisterNotifier>();
    final watch = context.watch<RegisterNotifier>();
    return CustomButton(
      onTap: () => read.registerClick(context),
      buttonTxt: "Register",
      buttonLoading: watch.isLoading,
    );
  }

  Widget _login(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () => AppNavigator.pushAndRemove(context, LoginPage()),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 18,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }

  Widget _spacing() {
    return SizedBox(
      height: 20,
    );
  }
}
