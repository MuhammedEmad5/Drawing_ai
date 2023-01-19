import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/constant/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.widget,
      required this.onPressed,
      this.mini = false,
      this.horizontalPadding = 8.0})
      : super(key: key);

  final Widget widget;
  final VoidCallback? onPressed;
  final bool mini;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          width: double.infinity,
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            mini: mini,
            backgroundColor: AppColors.blueLight,
            elevation: 10,
            enableFeedback: false,
            onPressed: onPressed,
            child: widget,
          ),
        ),
      ),
    );
  }
}
