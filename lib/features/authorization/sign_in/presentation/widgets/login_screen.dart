import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/presentation/forgot_password_page.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/presentation/registration_page.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController controllerForLogin;
  final TextEditingController controllerForPassword;
  final Bloc bloc;
  final GlobalKey<FormState> formKey;
  final Widget widgetChild;

  const LoginScreen(
      {Key? key,
      required this.controllerForLogin,
      required this.controllerForPassword,
      required this.bloc,
      required this.formKey,
      required this.widgetChild})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _State(
      controllerForLogin, controllerForPassword, bloc, formKey, widgetChild);
}

class _State extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _controllerForLogin;
  final TextEditingController _controllerForPassword;
  final Bloc bloc;
  final GlobalKey<FormState> _formKey;
  final Widget widgetChild;

  _State(this._controllerForLogin, this._controllerForPassword, this.bloc,
      this._formKey, this.widgetChild);

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
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
                    'Sign In',
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
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email empty!';
                            }
                          },
                          controller: _controllerForLogin,
                          decoration: const InputDecoration(
                            label: Text('email'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is empty!';
                            }
                          },
                          controller: _controllerForPassword,
                          decoration: const InputDecoration(
                            label: Text('password'),
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
                                  bloc.add(AuthEvent(
                                      login: _controllerForLogin.text.trim(),
                                      password:
                                          _controllerForPassword.text.trim(),
                                      context: context));
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
                                context.push('/forgot_password');
                              },
                              child: Text('Forgot password?')),
                          TextButton(onPressed: () {
                            context.push('/registration');
                          }, child: Text('Sign Up'))
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
}
