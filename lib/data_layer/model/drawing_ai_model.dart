class DrawingAiModel {
  int? created;
  List<Data>? data;

  DrawingAiModel({this.created, this.data});

  DrawingAiModel.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? url;
  Data({this.url});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

}