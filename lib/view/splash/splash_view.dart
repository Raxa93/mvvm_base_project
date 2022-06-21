import 'package:flutter/material.dart';
import 'package:mvvm_with_asif/data/services/splash_service.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'splash_screen';
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashService splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text('Splash screen',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
