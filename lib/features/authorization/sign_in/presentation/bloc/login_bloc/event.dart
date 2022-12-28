import 'package:flutter/material.dart';

abstract class LoginEvent {}

class AuthEvent extends LoginEvent {
  final String login;
  final String password;
  final BuildContext context;

  AuthEvent({required this.login, required this.password, required this.context});
}