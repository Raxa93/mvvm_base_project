import 'package:flutter/material.dart';
import 'package:mvvm_with_asif/data/routes/routes_settings.dart';
import 'package:mvvm_with_asif/view/splash/splash_view.dart';
import 'package:mvvm_with_asif/view_model/auth_view_model.dart';
import 'package:mvvm_with_asif/view_model/home_view_model.dart';
import 'package:mvvm_with_asif/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: (settings) => generateRoute(settings),
    ),
    );
  }
}
