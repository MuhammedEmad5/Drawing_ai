import 'package:ai_drawing/presentation_layer/screens/photo_view_screen.dart';
import 'package:ai_drawing/shared/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_cubit.dart';
import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_states.dart';
import '../../shared/constant/app_constants.dart';

class DrawingResultsScreen extends StatelessWidget {
  const DrawingResultsScreen({Key? key}) : super(key: key);

  Widget imageBuilder(int index, DrawingAiCubit cubit, context) {
    return InkWell(
      onTap: () {
        inKWellTap(cubit, context, index);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.blueLight),
            borderRadius: BorderRadius.circular(16.5.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: stackImageItem(cubit, context, index),
        ),
      ),
    );
  }

  Widget stackImageItem(DrawingAiCubit cubit, context, int index) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(
            cubit.drawingAiModel!.data![index].url!,
          ),
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: AppConstants.loadingWidget(30),
            );
          },
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        AppConstants.downLoadButton(
            context,
            cubit.drawingAiModel!.data![index].url!,
            vertical: 0,
            horizontal: 0,
            false),
      ],
    );
  }

  void inKWellTap(DrawingAiCubit cubit, context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PhotoViewScreen(
                imageUrl: cubit.drawingAiModel!.data![index].url!)));
  }

  Widget listViewOfImages(DrawingAiCubit cubit) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => imageBuilder(index, cubit, context),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: cubit.drawingAiModel!.data!.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawingAiCubit, DrawingAiStates>(
      builder: (BuildContext context, state) {
        var cubit = DrawingAiCubit().get(context);
        return Scaffold(
          appBar: AppConstants.defaultAppBar(leading: AppConstants.backButtonIcon(context),),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                cubit.drawingAiModel!.data!.isEmpty
                    ? AppConstants.loadingWidget(30)
                    : listViewOfImages(cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
