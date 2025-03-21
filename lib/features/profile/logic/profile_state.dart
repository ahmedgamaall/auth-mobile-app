import 'package:auth_mobile_app/features/profile/data/models/user_data_response.dart';

abstract class ProfileState {}

class InitState extends ProfileState {}

class LoadingProfileInfo extends ProfileState {}

class SuccessProfileInfo extends ProfileState {
  final UserDataResponse userData;
  SuccessProfileInfo({required this.userData});
}

class ErrorProfileInfo extends ProfileState {
  final String message;
  ErrorProfileInfo({required this.message});
}
