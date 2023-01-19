import 'package:ai_drawing/presentation_layer/screens/home_screen.dart';
import 'package:ai_drawing/shared/constant/app_colors.dart';
import 'package:ai_drawing/shared/constant/app_strings.dart';
import 'package:ai_drawing/shared/constant/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'business_logic_layer/drawing_ai_cubit/drawing_ai_cubit.dart';


void main(){

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DrawingAiCubit(),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: AppStrings.ubuntu,
                scaffoldBackgroundColor: AppColors.withe
              ),
              home: HomeScreen(),
            );
          }),
    );
  }
}
