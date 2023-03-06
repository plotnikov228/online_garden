import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/bloc/forgot_password_bloc/event.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/bloc/forgot_password_bloc/state.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/presentation/login_page.dart';



class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(super.initialState) {
    on<ResetPasswordEvent>((event, emit) async {
      emit(ForgotPasswordLoadingState());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
          email: event.email,).then((val) {
        event.context.go('/login');
      }).catchError((error) {
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text(error.toString())));
      });

    }
    );
  }
}
