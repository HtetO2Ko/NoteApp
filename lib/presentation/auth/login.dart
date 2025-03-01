import 'package:flutter/material.dart';
import 'package:note_app/core/configs/assets/app_vector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/presentation/auth/notifier/login_notifier.dart';
import 'package:note_app/presentation/auth/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  _login(context),
                  _register(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField(BuildContext context, ThemeData theme) {
    final read = context.read<LoginNotifier>();
    return TextField(
      controller: read.emailCtr,
      decoration: InputDecoration(
        label: Text("Email"),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context, ThemeData theme) {
    final read = context.read<LoginNotifier>();
    final watch = context.read<LoginNotifier>();
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

  Widget _login(BuildContext context) {
    final read = context.read<LoginNotifier>();
    final watch = context.watch<LoginNotifier>();
    return CustomButton(
      onTap: () => read.loginClick(context),
      buttonTxt: "Login",
      buttonLoading: watch.isLoading,
    );
  }

  Widget _register(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () => AppNavigator.pushAndRemove(context, RegisterPage()),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Register",
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
