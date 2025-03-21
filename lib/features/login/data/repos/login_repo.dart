import 'package:auth_mobile_app/features/login/data/models/login_request_body.dart';
import 'package:dartz/dartz.dart';
import 'package:auth_mobile_app/core/networking/api_error_handler.dart';
import 'package:auth_mobile_app/core/networking/api_error_model.dart';
import 'package:auth_mobile_app/core/networking/api_service.dart';
import 'package:auth_mobile_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<ApiErrorModel, LoginResponse>> loginUser(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.loginUser(loginRequestBody);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
