import 'package:auth_mobile_app/features/register/data/models/register_response.dart';

abstract class RegisterState {}

class InitState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  final RegisterResponse response;

  SuccessRegisterState({required this.response});
}

class ErrorRegisterState extends RegisterState {
  final String message;

  ErrorRegisterState({required this.message});
}
