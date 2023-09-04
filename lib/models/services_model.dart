class servicesModel {
  String? uuid;
  bool? status;
  String? nameTranslate;
  String? icon;

  servicesModel({this.uuid, this.status, this.nameTranslate, this.icon});

  servicesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    status = json['status'];
    nameTranslate = json['name_translate'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['status'] = this.status;
    data['name_translate'] = this.nameTranslate;
    data['icon'] = this.icon;
    return data;
  }
}
