import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:auth_mobile_app/core/theming/colors.dart';
import 'package:auth_mobile_app/core/widgets/logo_banner.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_cubit.dart';
import 'package:auth_mobile_app/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/core/theming/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AvatarBlocBuilder extends StatelessWidget {
  const AvatarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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
                          (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
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
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              verticalSpace(100),
              Text(
                // '${state.userData.firstName} ${state.userData.lastName}',
                'Ahmed Gamal',
                style: TextStyles.font20Black700,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
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
                  ),
                ),
              ),
              verticalSpace(100),
              Text(
                'User Name',
                style: TextStyles.font20Black700,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
