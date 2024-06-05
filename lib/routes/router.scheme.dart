import 'package:av3/modules/authentication/create_account.page.dart';
import 'package:av3/modules/authentication/login.page.dart';
import 'package:av3/modules/home/home.page.dart';
import 'package:flutter/material.dart';


abstract class RoutersUtil {
  static const String login = "/";
  static const String createAccount = "/createAccount";
  static const String home = "/home";


  static Map<String, WidgetBuilder> routers = {
    RoutersUtil.login: (context) => const LoginPage(),
    RoutersUtil.createAccount: (context) => const CreateAccountPage(),
    RoutersUtil.home: (context) => const HomePage(),
  };
}
