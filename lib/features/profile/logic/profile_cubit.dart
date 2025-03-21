import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_mobile_app/features/profile/data/repos/profile_repo.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(InitState());

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getProfileInfo() async {
    emit(LoadingProfileInfo());
    final response = await _profileRepo.getUserData();
    response.fold(
      (error) {
        emit(ErrorProfileInfo(message: error.message ?? 'Failure'));
      },
      (userData) async {
        usernameController.text = userData.username;
        emailController.text = userData.email;
        genderController.text = userData.gender;
        emit(SuccessProfileInfo(userData: userData));
      },
    );
  }
}
