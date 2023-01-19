import 'package:ai_drawing/shared/constant/app_colors.dart';
import 'package:ai_drawing/shared/constant/app_constants.dart';
import 'package:ai_drawing/shared/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

bool howToCreate=false;
bool whatArePrompt=false;
bool instructions=false;
bool examples=false;

TextSpan boldTextSpan(String text) {
  return TextSpan(
      text: text,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500,color: Colors.black,fontFamily: AppStrings.ubuntu));
}

TextSpan lightTextSpan(String text) {
  return TextSpan(
      text: text,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300,color: Colors.black,fontFamily: AppStrings.ubuntu));
}


class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstants.defaultAppBar(leading:AppConstants.backButtonIcon(context)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    howToCreate=!howToCreate;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.blueDeep,
                    borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Row(
                    children: [
                      howToCreate?Icon(Icons.keyboard_arrow_down_rounded,size: 35.w,color: AppColors.withe,):Icon(Icons.keyboard_arrow_right_outlined,size: 35.w,color: AppColors.withe,),
                      Expanded(
                        child: Text(
                          AppStrings.instructionsTitle,
                          style: TextStyle(
                              color: AppColors.withe,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              howToCreate?Text(
                AppStrings.instructionsDetails,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ):const SizedBox(),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  setState(() {
                    whatArePrompt=!whatArePrompt;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: AppColors.blueDeep,
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Row(
                    children: [
                      whatArePrompt?Icon(Icons.keyboard_arrow_down_rounded,size: 35.w,color: AppColors.withe,):Icon(Icons.keyboard_arrow_right_outlined,size: 35.w,color: AppColors.withe,),
                      Expanded(
                        child: Text(
                          AppStrings.promptsTitle,
                          style: TextStyle(
                              color: AppColors.withe,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              whatArePrompt?Text(
                AppStrings.promptsDetails,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ):const SizedBox(),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  setState(() {
                    instructions=!instructions;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: AppColors.blueDeep,
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Row(
                    children: [
                      instructions?Icon(Icons.keyboard_arrow_down_rounded,size: 35.w,color: AppColors.withe,):Icon(Icons.keyboard_arrow_right_outlined,size: 35.w,color: AppColors.withe,),
                      Expanded(
                        child: Text(
                          'Instructions',
                          style: TextStyle(
                              color: AppColors.withe,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              instructions?Column(
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions1),
                          lightTextSpan(AppStrings.instructions1_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions2),
                          lightTextSpan(AppStrings.instructions2_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions3),
                          lightTextSpan(AppStrings.instructions3_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions4),
                          lightTextSpan(AppStrings.instructions4_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions5),
                          lightTextSpan(AppStrings.instructions5_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions6),
                          lightTextSpan(AppStrings.instructions6_2),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          boldTextSpan(AppStrings.instructions7),
                          lightTextSpan(AppStrings.instructions7_2),
                        ]),
                  ),
                ],
              ):const SizedBox(),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  setState(() {
                    examples=!examples;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: AppColors.blueDeep,
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Row(
                    children: [
                      examples?Icon(Icons.keyboard_arrow_down_rounded,size: 35.w,color: AppColors.withe,):Icon(Icons.keyboard_arrow_right_outlined,size: 35.w,color: AppColors.withe,),
                      Expanded(
                        child: Text(
                          AppStrings.example,
                          style: TextStyle(
                              color: AppColors.withe,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              examples?Column(
                children: [
                  InkWell(
                    onLongPress: (){
                   Clipboard.setData(const ClipboardData(text: AppStrings.example1)).then((value) {
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied'),));
                   });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Text(
                        AppStrings.example1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onLongPress: (){
                      Clipboard.setData(const ClipboardData(text: AppStrings.example2)).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied'),));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Text(
                        AppStrings.example2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onLongPress: (){
                      Clipboard.setData(const ClipboardData(text: AppStrings.example3)).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied'),));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Text(
                        AppStrings.example3,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onLongPress: (){
                      Clipboard.setData(const ClipboardData(text: AppStrings.example4)).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied'),));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Text(
                        AppStrings.example4,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ):const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
