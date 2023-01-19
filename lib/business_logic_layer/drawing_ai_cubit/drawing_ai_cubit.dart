import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../../data_layer/api_server/api_dio.dart';
import '../../data_layer/model/drawing_ai_model.dart';
import '../../data_layer/repository/repository.dart';
import '../../shared/constant/app_colors.dart';
import 'drawing_ai_states.dart';

class DrawingAiCubit extends Cubit<DrawingAiStates> {
  DrawingAiCubit() : super(DrawingAiInitialState());

  DrawingAiCubit get(context) => BlocProvider.of(context);
  final DrawingAiRepository drawingAiRepository =
      DrawingAiRepository(DrawingAiDio());

  DrawingAiModel? drawingAiModel;

  Future<void> getDrawingAiData(String text, int numberOfImages) async {
    emit(GetDrawingAiLoadingState());
    await drawingAiRepository
        .generateDrawing(text, numberOfImages)
        .then((value) {
      drawingAiModel = value;
      emit(GetDrawingAiDataSuccessState(drawingAiModel!));
      return value;
    }).catchError((error) {
      if (kDebugMode) {
        print('The Error is ${error.toString()}');
      }
      emit(GetDrawingAiDataErrorState());
    });
  }

  Future<void> saveImage(String url, context) async {
    emit(SaveImageLoadingState());
    await GallerySaver.saveImage(url, albumName: 'DrawingAi').then((value) {
      if (value!) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('downLoaded'),
            backgroundColor: AppColors.blueLight,
          ),
        );
        emit(SaveImageDataSuccessState());
      }
    }).catchError((error){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('error'),
          backgroundColor: AppColors.orangeDeep,
        ),
      );
    });
  }
}
