import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';

import '../authorization/sign_in/presentation/presentation/login_page.dart';
import '../main/presentation/bloc/bloc/presentation.dart';

class AuthorizationVerification extends StatelessWidget {
  const AuthorizationVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if(snapshot.hasData) {

                return const MainPage();
              }
              else {

                return const LoginPage();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}