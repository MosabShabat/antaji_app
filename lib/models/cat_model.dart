class CatModel {
  String? uuid;
  String? nameTranslate;

  CatModel({this.uuid, this.nameTranslate});

  CatModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nameTranslate = json['name_translate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name_translate'] = this.nameTranslate;
    return data;
  }
}
