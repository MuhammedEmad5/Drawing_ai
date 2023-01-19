
import '../../data_layer/model/drawing_ai_model.dart';

abstract class DrawingAiStates{}

class DrawingAiInitialState extends DrawingAiStates{}

class GetDrawingAiLoadingState extends DrawingAiStates{}
class GetDrawingAiDataSuccessState extends DrawingAiStates{
  final DrawingAiModel drawingAiModel;

  GetDrawingAiDataSuccessState(this.drawingAiModel);
}
class GetDrawingAiDataErrorState extends DrawingAiStates{}

class SaveImageLoadingState extends DrawingAiStates{}
class SaveImageDataSuccessState extends DrawingAiStates{}
class SaveImageDataErrorState extends DrawingAiStates{
  final String error;

  SaveImageDataErrorState(this.error);
}