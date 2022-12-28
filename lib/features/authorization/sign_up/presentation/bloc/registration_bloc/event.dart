import 'package:flutter/material.dart';

abstract class RegistrationEvent {}

class SignUpEvent extends RegistrationEvent {
  final String login;
  final String password;
  final String username;
  final BuildContext context;
  SignUpEvent( {required this.login, required this.password, required this.username, required this.context});
}