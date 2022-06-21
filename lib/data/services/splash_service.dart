import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_asif/data/model/user_model.dart';
import 'package:mvvm_with_asif/view/authentication/login_view.dart';
import 'package:mvvm_with_asif/view/home_screen.dart';
import 'package:mvvm_with_asif/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      print('This is token value ${value.token}');
      if (value.token == 'null' || value.token == '') {
        print('i am in if with token : ${value.token}');
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, LoginView.routeName);
      } else {
        print('i am in else with token : ${value.token}');
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    }).onError((error, stackTrace) {
      debugPrint('Error in splash service is $error');
    });
  }
}
