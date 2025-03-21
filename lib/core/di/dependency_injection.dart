import 'package:auth_mobile_app/features/profile/data/repos/profile_repo.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:auth_mobile_app/core/networking/api_service.dart';
import 'package:auth_mobile_app/core/networking/dio_factory.dart';
import 'package:auth_mobile_app/features/login/data/repos/login_repo.dart';
import 'package:auth_mobile_app/features/login/logic/login_cubit.dart';
import 'package:auth_mobile_app/features/register/data/repos/register_repo.dart';
import 'package:auth_mobile_app/features/register/logic/register_cubit.dart';

final getIt = GetIt.instance;

/// Dependency Injection
void setupDi() {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // api
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<RegisterRepo>()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));
}
