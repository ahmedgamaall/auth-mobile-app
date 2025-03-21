import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_state.dart';
import 'package:auth_mobile_app/features/profile/ui/widgets/info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoFormBlocBuilder extends StatelessWidget {
  const InfoFormBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen:
          (previous, current) =>
              current is LoadingProfileInfo ||
              current is SuccessProfileInfo ||
              current is ErrorProfileInfo,
      builder: (context, state) {
        if (state is SuccessProfileInfo) {
          return const InfoForm();
        } 
        return const InfoForm();
      },
    );
  }
}
