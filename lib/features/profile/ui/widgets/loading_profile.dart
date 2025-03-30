import 'package:auth_mobile_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProfile extends StatelessWidget {
  const LoadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          const LoadingField(),
          verticalSpace(20),
          const LoadingField(),
          verticalSpace(20),
          const LoadingField(),
        ],
      ),
    );
  }
}

class LoadingField extends StatelessWidget {
  const LoadingField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey[300],
      ),
    );
  }
}