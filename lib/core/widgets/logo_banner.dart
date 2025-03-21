import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoBanner extends StatelessWidget {
  final Widget? child;

  const LogoBanner({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: FractionalOffset.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset('assets/images/upper_frame_auth.png'),
          ),
          Positioned(
            bottom: -80.h,
            child:
                child == null
                    ? Image.asset('assets/images/logo_auth.png')
                    : child!,
          ),
        ],
      ),
    );
  }
}
