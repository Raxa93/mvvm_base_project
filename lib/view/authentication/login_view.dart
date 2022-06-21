// ignore_for_file: prefer_final_fields
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_with_asif/view/authentication/register_view.dart';
import 'package:mvvm_with_asif/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static const routeName = 'login_screen';

  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    obscurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.grey[700],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(hintText: 'Email', labelText: 'Email', prefixIcon: Icon(Icons.email)),
              onFieldSubmitted: (val) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: obscurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                            onTap: () {
                              obscurePassword.value = !obscurePassword.value;
                            },
                            child: obscurePassword.value == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))),
                    onFieldSubmitted: (val) {
                      FocusScope.of(context).requestFocus();
                    },
                  );
                }),
            SizedBox(height: height * 0.07),
            ElevatedButton(
                onPressed: () {
                  Map loginData = {
                    'email': _emailController.text.trim().toString(),
                    'password': _passwordController.text.trim().toString()
                  };
                  if (_emailController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Email cant be empty');
                  } else if (_passwordController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Password cant be empty');
                  } else if (_passwordController.text.length < 6) {
                    Fluttertoast.showToast(msg: 'Password must be 6 character long');
                  } else {
                    debugPrint('Everything is fine');
                    authVm.loginApi(loginData, context);
                  }
                },
                child: const Text('SignIn')),
            SizedBox(height: height * 0.05),
            RichText(
              text:  TextSpan(children: <TextSpan>[
                const TextSpan(text: "Don't have account, ", style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: "Register Now",
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.pushReplacementNamed(context, RegisterView.routeName);
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
