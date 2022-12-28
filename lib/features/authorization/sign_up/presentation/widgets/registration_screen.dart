import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/presentation/forgot_password_page.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/presentation/login_page.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/event.dart';

Widget RegistrationScreen(
    BuildContext context,
    TextEditingController _controllerForLogin,
    TextEditingController _controllerForPassword,
    TextEditingController _controllerForUsername,
    Bloc bloc,
    GlobalKey<FormState> _formKey,
    Widget widgetChild) {
  String? validatorForLogin(String? value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
    if (value!.isEmpty) {
      return 'Email or password must not be empty!';
    }
    if (!regex.hasMatch(value)) {
      return 'Email has the wrong format!';
    }
  }

  String? validatorForPassword(String? value) {
    RegExp regexUpperCase = RegExp(r'^(?=.*?[A-Z]).{7,19}$');
    RegExp regexLowerCase = RegExp(r'^(?=.*[a-z]).{7,19}$');
    RegExp regexRusSymbols = RegExp(r'^(?=.*[а-яА-Я]).{7,19}$');
    RegExp regexDigit = RegExp(r'^(?=.*?[0-9]).{7,19}$');
    RegExp regexSpecialCharacter = RegExp(r'^(?=.*?[!@#\$&*~]).{7,19}$');
    if (value!.isEmpty) {
      return 'Login or password must not be empty!';
    }
    if (value.length < 6 || value.length > 20) {
      return 'The length of the password can not be less than 6 and be more than 20!';
    }
    if (!regexUpperCase.hasMatch(value)) {
      return 'Password must contain one capital letter!';
    }
    if (!regexLowerCase.hasMatch(value)) {
      return 'Password must contain one capital letter!';
    }
    if (regexRusSymbols.hasMatch(value)) {
      return 'The password must consist only of latin letters!';
    }
    if (!regexDigit.hasMatch(value)) {
      return ('Password should contain at least one digit');
    }
    if (!regexSpecialCharacter.hasMatch(value)) {
      return 'Password should contain at least one special character';
    }
  }

  return Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 40),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validatorForLogin,
                        controller: _controllerForLogin,
                        decoration: const InputDecoration(
                          label: Text('email'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Username empty!';
                          }
                        },
                        controller: _controllerForUsername,
                        decoration: const InputDecoration(
                          label: Text('username'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: validatorForPassword,
                        controller: _controllerForPassword,
                        decoration: const InputDecoration(
                          label: Text('password'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (String? value) {
                          if (value! != _controllerForPassword.text.trim()) {
                            return 'Passwords are not equal';
                          }
                          if (value!.isEmpty) {
                            return 'Password is empty!';
                          }
                        },
                        decoration: const InputDecoration(
                          label: Text('repeat password'),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                bloc.add(SignUpEvent(
                                    login: _controllerForLogin.text.trim(),
                                    password:
                                        _controllerForPassword.text.trim(),
                                    username: _controllerForUsername.text.trim(),
                                    context: context,

                                ));
                              }
                            },
                            child: widgetChild,
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                      const ForgotPasswordPage())));
                            }, child: Text('Forgot password?')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const LoginPage())),
                                  (route) => false);
                            },
                            child: Text('Sign In'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
