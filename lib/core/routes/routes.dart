import 'package:flutter/material.dart';
import 'package:emed/view/auth/login/login_view.dart';
import 'package:emed/view/auth/signup/signup_view.dart';
import 'package:emed/view/home/view/home_view.dart';
import 'package:emed/view/screens/splash_screen.dart';

class Routes {
  static final Routes _instance = Routes.init();
  static Routes get instantce => _instance;
  Routes.init();
  Route? onGeneralRoute(RouteSettings set) {
    var args = set.arguments;
    switch (set.name) {
      case '/splashscreen':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/loginview':
        return MaterialPageRoute(builder: (context) => const LoginView());
      case '/signupview':
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case '/homeview':
        return MaterialPageRoute(builder: (context) => const EmedHomeView());
    }
  }
}
