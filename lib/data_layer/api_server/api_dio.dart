import 'package:ai_drawing/shared/constant/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class DrawingAiDio{
  Dio? dio;

  DrawingAiDio(){
    BaseOptions options=BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: 20*1000,
      connectTimeout: 20 *1000,
    );

    dio=Dio(options);
  }

  Future<Response?> generateDrawing(String text, int numberOfImages ) async {
    try {
      Response response = await dio!.post(AppStrings.baseUrl,
          data: {
            "prompt": text,
            "model": "image-alpha-001",
            "n":numberOfImages,
            "size": "1024x1024"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppStrings.apiKey}"
          }));
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }



}
