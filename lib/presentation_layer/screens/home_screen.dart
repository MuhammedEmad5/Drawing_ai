import 'package:ai_drawing/presentation_layer/screens/instructions_screen.dart';
import 'package:ai_drawing/presentation_layer/screens/results_screen.dart';
import 'package:ai_drawing/presentation_layer/widgets/default_button.dart';
import 'package:ai_drawing/shared/constant/app_colors.dart';
import 'package:ai_drawing/shared/constant/app_constants.dart';
import 'package:ai_drawing/shared/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_cubit.dart';
import '../../business_logic_layer/drawing_ai_cubit/drawing_ai_states.dart';
import '../widgets/form_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget coverImage() {
    return Image(
      image: const AssetImage(AppImages.imagination),
      height: 200.h,
      width: double.infinity,
    );
  }

  Widget formField() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DefaultFormField(
              controller: textController,
              validate: (value) {
                if (value.isEmpty) {
                  return 'Imagine anything';
                }
                return null;
              },
              prefix: Icons.text_fields,
              keyBoardType: TextInputType.text,
              hintText: 'Imagine anything',
            ),
          ],
        ),
      ),
    );
  }

  Widget clearButton(context){
    return TextButton(
        onPressed: () {textController.clear();},
        child: Text(
          'clear',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,color: AppColors.blueLight,),
        ));
  }

  Widget learnMorButton(context){
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const InstructionsScreen()));
        },
        child: Text(
          'learn more',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700,color: AppColors.blueLight),
        ));
  }

  Widget generateImagesButton() {
    return BlocConsumer<DrawingAiCubit, DrawingAiStates>(
      listener: (BuildContext context, state) {
        if (state is GetDrawingAiDataSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const DrawingResultsScreen()));
        }
      },
      builder: (BuildContext context, state) {
        var cubit = DrawingAiCubit().get(context);
        return state is GetDrawingAiLoadingState
            ? AppConstants.loadingWidget(50)
            : DefaultButton(
                widget: Text(
                  'Generate Images',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
                horizontalPadding: 30,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cubit.getDrawingAiData(textController.text, 10);
                  }
                },
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstants.defaultAppBar(actions: [
        learnMorButton(context)
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                coverImage(),
                SizedBox(
                  height: 80.h,
                ),
                formField(),
                Row(children: [
                  const Spacer(),
                  clearButton(context),
                ],),
                SizedBox(
                  height: 30.h,
                ),
                generateImagesButton(),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
