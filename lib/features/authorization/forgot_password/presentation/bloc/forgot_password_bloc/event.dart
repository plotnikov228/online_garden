import 'package:flutter/material.dart';

abstract class ForgotPasswordEvent {}

class ResetPasswordEvent extends ForgotPasswordEvent {
  final String email;
  final BuildContext context;

  ResetPasswordEvent({required this.email, required this.context});
}