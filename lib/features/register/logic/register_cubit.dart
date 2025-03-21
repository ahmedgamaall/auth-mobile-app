import 'package:auth_mobile_app/features/register/data/models/register_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:auth_mobile_app/features/register/data/repos/register_repo.dart';
import 'package:auth_mobile_app/features/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(InitState());

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitRegisterStates() async {
    emit(LoadingRegisterState());
    final response = await _registerRepo.registerUser(
      RegisterRequestBody(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (error) {
        emit(ErrorRegisterState(message: error.message ?? 'Failure'));
      },
      (createSession) async {
        rememberMe = true;
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          accessToken,
        );
        emit(SuccessRegisterState(response: createSession));
      },
    );
  }
}
