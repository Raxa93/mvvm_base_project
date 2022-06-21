import 'package:flutter/material.dart';
import 'package:mvvm_with_asif/view/authentication/register_view.dart';
import 'package:mvvm_with_asif/view/home_screen.dart';
import 'package:mvvm_with_asif/view/authentication/login_view.dart';
import 'package:mvvm_with_asif/view/splash/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return errorRoute();
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}