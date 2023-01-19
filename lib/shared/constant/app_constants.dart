import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_cubit.dart';
import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_states.dart';
import 'app_colors.dart';

class AppConstants {
  static Widget loadingWidget(double size) {
    return LoadingAnimationWidget.twistingDots(
        leftDotColor: AppColors.blueLight,
        rightDotColor: AppColors.blueDeep,
        size: size);
  }

  static Widget backButtonIcon(context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 40.w,
          color: AppColors.blueLight,
          shadows: const [
            Shadow(color: AppColors.blueDeep,blurRadius: 3,offset: Offset(4,0))
          ],
        ));
  }

  static Widget downLoadButton(context, String imageUrl,bool backGround,
      {double horizontal = 20, double vertical = 10}) {
    return BlocBuilder<DrawingAiCubit, DrawingAiStates>(
      builder: (BuildContext context, Object? state) {
        var cubit = DrawingAiCubit().get(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontal.w, vertical: vertical.h),
          child: state is SaveImageLoadingState
              ? loadingWidget(30.w)
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueLight.withOpacity(backGround?0.6:0),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: IconButton(
                      onPressed: () {
                        cubit.saveImage(imageUrl, context);
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.download,
                        size: 30.w,
                        color: backGround?AppColors.withe:AppColors.blueLight,
                      )),
                ),
        );
      },
    );
  }

  static AppBar defaultAppBar(
      {Color statusBarColor = Colors.white,
      Brightness statusBarIconBrightness = Brightness.dark,Color backGroundColor=AppColors.withe, List<Widget>?actions,Widget? leading}) {
    return AppBar(
      elevation: 0,
      backgroundColor: backGroundColor,
      actions:actions,
      leading: leading,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }
}
