import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/bloc/forgot_password_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/presentation/registration_page.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final TextEditingController controllerForLogin;
  final Bloc bloc;
  final GlobalKey<FormState> formKey;
  final Widget widgetChild;

  const ForgotPasswordScreen(
      {Key? key,
      required this.controllerForLogin,
      required this.bloc,
      required this.formKey,
      required this.widgetChild})
      : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() =>
      _State(controllerForLogin, bloc, formKey, widgetChild);
}

class _State extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controllerForLogin;
  final Bloc bloc;
  final GlobalKey<FormState> _formKey;
  final Widget widgetChild;

  _State(this._controllerForLogin, this.bloc, this._formKey, this.widgetChild);

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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                      child: Text(
                        'Reset password',
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'You will receive an email about changing your password.',
                              style: TextStyle(
                                color: Colors.grey[800],
                              ),
                          ),
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
                                hintText: 'Enter your email here',
                                label: Text('email'),
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
                                      bloc.add(ResetPasswordEvent(
                                          email: _controllerForLogin.text.trim(),
                                          context: context));
                                    }
                                  },
                                  child: widgetChild,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
