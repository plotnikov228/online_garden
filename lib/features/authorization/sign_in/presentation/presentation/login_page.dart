import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/bloc.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/state.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/widgets/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginBloc(LoginInitialState()),
        child: const Scaffold(body: LoginBlocBuilder()));
  }
}

class LoginBlocBuilder extends StatelessWidget {
  const LoginBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        TextEditingController controllerForLogin = TextEditingController();
        TextEditingController controllerForPassword = TextEditingController();
        final formKey = GlobalKey<FormState>();
        if (state is LoginInitialState) {
          return LoginScreen(
              controllerForLogin: controllerForLogin,
              controllerForPassword: controllerForPassword,
              bloc: bloc,
              formKey: formKey,
              widgetChild: const Text('Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  )),);
        }
        if (state is LoginLoadingState) {
          return LoginScreen(
              controllerForLogin: controllerForLogin,
              controllerForPassword: controllerForPassword,
              bloc: bloc,
              formKey: formKey,
              widgetChild: const CircularProgressIndicator(color: Colors.white,));
        } else {
          return LoginScreen(
              controllerForLogin: controllerForLogin,
              controllerForPassword: controllerForPassword,
              bloc: bloc,
              formKey: formKey,
              widgetChild: const Icon(Icons.check,
                color: Colors.white,
              ));
        }
      },
    );
  }
}
