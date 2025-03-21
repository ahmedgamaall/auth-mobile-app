import 'package:auth_mobile_app/features/register/data/models/register_request_body.dart';
import 'package:auth_mobile_app/features/register/data/models/register_response.dart';
import 'package:dartz/dartz.dart';
import 'package:auth_mobile_app/core/networking/api_error_handler.dart';
import 'package:auth_mobile_app/core/networking/api_error_model.dart';
import 'package:auth_mobile_app/core/networking/api_service.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<Either<ApiErrorModel, RegisterResponse>> registerUser(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final response = await _apiService.registerUser(registerRequestBody);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
