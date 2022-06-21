import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_with_asif/data/model/user_model.dart';
import 'package:mvvm_with_asif/data/repository/auth_repository.dart';
import 'package:mvvm_with_asif/view/home_screen.dart';
import 'package:mvvm_with_asif/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  final _loginRepo = AuthRepository();

  bool _loading = false;
  bool _signupLoading = false;

  bool get loading => _loading;
  bool get signupLoading => _signupLoading;

  setLoading(bool value) {
    _loading = loading;
    notifyListeners();
  }
  setSignupLoading(bool value) {
    _signupLoading = _signupLoading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _loginRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPref = Provider.of<UserViewModel>(context,listen: false);
      userPref.saveUser(
        UserModel(
          token: value.toString(),
        )
      );
      Fluttertoast.showToast(msg: 'Login Successful');
      Navigator.pushNamed(context, HomeScreen.routeName);

    }).onError((error, stackTrace) {
      setLoading(false);
      Fluttertoast.showToast(msg: '$error');
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _loginRepo.signupApi(data).then((value) {
      setSignupLoading(false);
      print('This is value $value');
      Fluttertoast.showToast(msg: 'Signup Successful');
      Navigator.pushNamed(context, HomeScreen.routeName);

    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Fluttertoast.showToast(msg: '$error');
    });
  }
}
