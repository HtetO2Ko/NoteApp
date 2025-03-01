import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/core/configs/theme/app_theme.dart';
import 'package:note_app/presentation/auth/login.dart';
import 'package:note_app/presentation/auth/notifier/login_notifier.dart';
import 'package:note_app/presentation/auth/notifier/register_notifier.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginNotifier()),
        ChangeNotifierProvider(create: (_) => RegisterNotifier()),
      ],
      child: MaterialApp(
        builder: FToastBuilder(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        title: 'Note',
        home: LoginPage(),
      ),
    );
  }
}
