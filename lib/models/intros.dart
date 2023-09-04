class Intros {
  String? uuid;
  int? status;
  String? image;
  String? titleTranslate;
  String? supTitleTranslate;

  Intros(
      {this.uuid,
      this.status,
      this.image,
      this.titleTranslate,
      this.supTitleTranslate});

  Intros.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    status = json['status'];
    image = json['image'];
    titleTranslate = json['title_translate'];
    supTitleTranslate = json['sup_title_translate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['status'] = this.status;
    data['image'] = this.image;
    data['title_translate'] = this.titleTranslate;
    data['sup_title_translate'] = this.supTitleTranslate;
    return data;
  }
}
