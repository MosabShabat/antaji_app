class AddLocationModel {
  String? uuid;
  String? name;
  String? image;
  String? categoriesName;
  String? price;
  String? currency;

  AddLocationModel(
      {this.uuid,
      this.name,
      this.image,
      this.categoriesName,
      this.price,
      this.currency});

  AddLocationModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    categoriesName = json['categories_name'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['categories_name'] = this.categoriesName;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}
