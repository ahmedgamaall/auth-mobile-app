import 'package:auth_mobile_app/features/login/data/models/login_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:auth_mobile_app/features/login/data/repos/login_repo.dart';
import 'package:auth_mobile_app/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(InitState());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  bool rememberMe = false;

  void emitLoginStates() async {
    emit(LoadingLoginState());
    final response = await _loginRepo.loginUser(
      LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (error) {
        emit(ErrorLoginState(message: error.message ?? 'Failure'));
      },
      (loginResponse) async {
        rememberMe = true;
        accessToken = loginResponse.accessToken;
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.accessToken,
          accessToken,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          loginResponse.refreshToken,
        );
        await SharedPrefHelper.setData(SharedPrefKeys.rememberMe, rememberMe);
        emit(SuccessLoginState(response: loginResponse));
      },
    );
  }
}
