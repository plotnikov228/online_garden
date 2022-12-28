import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/bloc/login_bloc/state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(super.initialState) {
    on<AuthEvent>((event, emit) async {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.login, password: event.password)
          .then((val) {
        Future.delayed(const Duration(seconds: 3));
        emit(LoginSuccessfulState());
      }).catchError((error) {

        ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(content: Text(error.toString())));
        emit(LoginInitialState());
      });
    });
  }
}
