import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(super.initialState) {
    on<SignUpEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.login, password: event.password)
          .then((val) {
        FirebaseAuth.instance.currentUser!.updateDisplayName(event.username);
        emit(RegistrationSuccessfulState());
        Future.delayed(const Duration(seconds: 3));
        event.context.go('/main');
      }).catchError((error) {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(SnackBar(content: Text(error)));
      });
    });
  }
}
