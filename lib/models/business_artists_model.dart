class ImagesModel {
  String? uuid;
  String? image;

  ImagesModel({this.uuid, this.image});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['image'] = this.image;
    return data;
  }
}
class VideosModel {
  String? uuid;
  int? view;
  String? title;
  String? time;
  String? image;
  String? video;
  String? artistName;

  VideosModel(
      {this.uuid,
      this.view,
      this.title,
      this.time,
      this.image,
      this.video,
      this.artistName});

  VideosModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    view = json['view'];
    title = json['title'];
    time = json['time'];
    image = json['image'];
    video = json['video'];
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['view'] = this.view;
    data['title'] = this.title;
    data['time'] = this.time;
    data['image'] = this.image;
    data['video'] = this.video;
    data['artist_name'] = this.artistName;
    return data;
  }
}
