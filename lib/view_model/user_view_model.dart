import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_asif/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModel user) async {
    debugPrint('Dont know from where i am called but i am gonna save token to prefrences ${user.token}');
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? token = sp.getString('token');

    return UserModel(token: token.toString());
  }

  Future<bool> logOut() async {

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return sp.clear();
  }
}
