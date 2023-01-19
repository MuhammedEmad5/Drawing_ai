import '../api_server/api_dio.dart';
import '../model/drawing_ai_model.dart';

class DrawingAiRepository{
 final DrawingAiDio drawingAiDio;

 DrawingAiRepository(this.drawingAiDio);


 Future<DrawingAiModel>generateDrawing(String text,int numberOfImages)async{
   try{
     final drawing=await drawingAiDio.generateDrawing(text,numberOfImages);

     return DrawingAiModel.fromJson(drawing!.data);
   }catch(e){
     print('the error is ${e.toString()}');
     return DrawingAiModel();
   }
 }

}