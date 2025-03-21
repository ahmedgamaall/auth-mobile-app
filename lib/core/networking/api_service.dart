import 'package:auth_mobile_app/features/login/data/models/login_request_body.dart';
import 'package:auth_mobile_app/features/profile/data/models/user_data_response.dart';
import 'package:auth_mobile_app/features/register/data/models/register_request_body.dart';
import 'package:auth_mobile_app/features/register/data/models/register_response.dart';
import 'package:dio/dio.dart';
import 'package:auth_mobile_app/core/networking/api_constants.dart';
import 'package:auth_mobile_app/core/networking/dio_factory.dart';
import 'package:auth_mobile_app/features/login/data/models/login_response.dart';

class ApiService {
  final Dio dio;
  const ApiService(this.dio);

  Future<RegisterResponse> registerUser(RegisterRequestBody registerRequestBody) async {
    var response = await DioFactory.postData(
      endPoint: ApiConstants.register,
      data: registerRequestBody.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }

  Future<LoginResponse> loginUser(LoginRequestBody loginRequestBody) async {
    var response = await DioFactory.postData(
      endPoint: ApiConstants.login,
      data: loginRequestBody.toJson(),
      // data: {
      //   "username": "emilys",
      //   "password": "emilyspass"
      // },
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<UserDataResponse> getUserData() async {
    var response = await DioFactory.getDataUseToken(
      endPoint: ApiConstants.user,
    );
    return UserDataResponse.fromJson(response.data);
  }
}
