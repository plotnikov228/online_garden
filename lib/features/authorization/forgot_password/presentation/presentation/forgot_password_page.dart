import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/bloc/forgot_password_bloc/bloc.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/bloc/forgot_password_bloc/state.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/widgets/forgot_password_screen.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc(ForgotPasswordInitialState()),
        child: Scaffold(body: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, state) {
            final bloc = context.read<ForgotPasswordBloc>();
            TextEditingController controllerForEmail = TextEditingController();
            final formKey = GlobalKey<FormState>();
            if (state is ForgotPasswordInitialState) {
              return ForgotPasswordScreen(
                controllerForLogin: controllerForEmail,
                bloc: bloc,
                formKey: formKey,
                widgetChild: const Text('Reset',
                    style: TextStyle(
                      color: Colors.white,
                    )),);
            }
            if (state is ForgotPasswordLoadingState) {
              return ForgotPasswordScreen(
                  controllerForLogin: controllerForEmail,
                  bloc: bloc,
                  formKey: formKey,
                  widgetChild: const CircularProgressIndicator(color: Colors.white,));
            } else {
              return ForgotPasswordScreen(
                  controllerForLogin: controllerForEmail,
                  bloc: bloc,
                  formKey: formKey,
                  widgetChild: const Icon(Icons.check,
                    color: Colors.white,
                  ));
            }
          },
        )));
  }
}
