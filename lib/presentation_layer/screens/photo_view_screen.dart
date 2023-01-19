import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../../shared/constant/app_constants.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstants.defaultAppBar(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
      backGroundColor: Colors.black,
        leading: AppConstants.backButtonIcon(context),
        actions: [AppConstants.downLoadButton(context,imageUrl,true),]
      ),
      body: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        maxScale: PhotoViewComputedScale.covered*0.9,
        minScale: PhotoViewComputedScale.covered*0.3,
      ),
    );
  }
}
