import 'package:auth_mobile_app/core/networking/api_error_handler.dart';
import 'package:auth_mobile_app/core/networking/api_error_model.dart';
import 'package:auth_mobile_app/core/networking/api_service.dart';
import 'package:auth_mobile_app/features/profile/data/models/user_data_response.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<Either<ApiErrorModel, UserDataResponse>> getUserData() async {
    try {
      final response = await _apiService.getUserData();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
