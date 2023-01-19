import 'package:ai_drawing/shared/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
   DefaultFormField(
      {Key? key,
      required this.validate,
      required this.controller,
      required this.keyBoardType,
      required this.hintText,
      required this.prefix,
      })
      : super(key: key);
  TextEditingController controller;
  TextInputType keyBoardType;
  FormFieldValidator validate;
  String hintText;
  IconData prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      maxLines: null,
      validator: validate,
      cursorColor: AppColors.blueLight,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp),
        prefixIcon: Icon(
          prefix,
          color: AppColors.blueLight,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: AppColors.blueLight,width: 20)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: AppColors.blueLight,width: 2)
        ),

      ),
    );
  }
}

