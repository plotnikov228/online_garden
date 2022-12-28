import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/state.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/bloc.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/state.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/widgets/registration_screen.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegistrationBloc(RegistrationInitialState()),
        child: Scaffold(body: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            var bloc = context.read<RegistrationBloc>();
            TextEditingController _controllerForLogin = TextEditingController();
            TextEditingController _controllerForPassword = TextEditingController();
            TextEditingController _controllerForUsername = TextEditingController();
            final _formKey = GlobalKey<FormState>();
            if (state is RegistrationInitialState) {


              return RegistrationScreen(
                  context,
                  _controllerForLogin,
                  _controllerForPassword,
                  _controllerForUsername,
                  bloc,
                  _formKey,
                  const Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      )));
            }
            if (state is RegistrationInitialState) {
              return RegistrationScreen(
                  context,
                  _controllerForLogin,
                  _controllerForPassword,
                  _controllerForUsername,
                  bloc,
                  _formKey,
                  const CircularProgressIndicator(color: Colors.white,));
            } else {

              return RegistrationScreen(
                  context,
                  _controllerForLogin,
                  _controllerForPassword,
                  _controllerForUsername,
                  bloc,
                  _formKey,
                  const Icon(Icons.check,
                    color: Colors.white,
                  ));
            }
          },
        )));
  }
}

