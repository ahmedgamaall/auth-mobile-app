import 'package:auth_mobile_app/core/helpers/constants.dart';
import 'package:auth_mobile_app/core/helpers/extensions.dart';
import 'package:auth_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/routing/routes.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/widgets/app_button.dart';
import 'package:auth_mobile_app/core/widgets/logo_banner.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_state.dart';
import 'package:auth_mobile_app/features/profile/ui/widgets/info_form_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen:
                    (previous, current) =>
                        current is LoadingProfileInfo ||
                        current is SuccessProfileInfo ||
                        current is ErrorProfileInfo,
                builder: (context, state) {
                  if (state is LoadingProfileInfo) {
                    return const CircularProgressIndicator();
                  } else if (state is SuccessProfileInfo) {
                    return Column(
                      children: [
                        LogoBanner(
                          child: Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorsManager.gray,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: CircleAvatar(
                              radius: 50.r,
                              backgroundColor: ColorsManager.blue,
                              child: CachedNetworkImage(
                                imageUrl: state.userData.image,
                                imageBuilder:
                                    (context, imageProvider) => Container(
                                      width: 100.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                placeholder:
                                    (context, url) =>
                                        const CircularProgressIndicator(),
                                errorWidget:
                                    (context, url, error) =>
                                        const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(100),
                        Text(
                          '${state.userData.firstName} ${state.userData.lastName}',
                          style: TextStyles.font20Black700,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  children: [
                    const InfoFormBlocBuilder(),
                    verticalSpace(20),
                    AppButton(
                      buttonText: "Logout",
                      backgroundColor: ColorsManager.red,
                      onPressed: () {
                        logout(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    await SharedPrefHelper.clearAllData();
    rememberMe = false;
    context.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (route) => false,
    );
  }
}
