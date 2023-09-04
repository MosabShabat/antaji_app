class CoursesModel {
  String? uuid;
  String? name;
  bool? isPurchased;
  String? price;
  String? currency;
  String? cover;
  int? count;

  CoursesModel(
      {this.uuid,
      this.name,
      this.isPurchased,
      this.price,
      this.currency,
      this.cover,
      this.count});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    isPurchased = json['is_purchased'];
    price = json['price'];
    currency = json['currency'];
    cover = json['cover'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['is_purchased'] = this.isPurchased;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['cover'] = this.cover;
    data['count'] = this.count;
    return data;
  }
}
