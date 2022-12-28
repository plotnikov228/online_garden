import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/event.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/bloc/registration_bloc/state.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/presentation.dart';

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
        Navigator.of(event.context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => const MainPage())), (route) => false);
      }).catchError((error) {
        ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(content: Text(error)));
      });
    });
  }
}
