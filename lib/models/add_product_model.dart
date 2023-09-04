class AddProductModel {
  String? uuid;
  String? name;
  String? image;
  String? contentType;
  String? categoryName;
  String? subCategoryName;
  String? price;
  String? currency;

  AddProductModel(
      {this.uuid,
      this.name,
      this.image,
      this.contentType,
      this.categoryName,
      this.subCategoryName,
      this.price,
      this.currency});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    contentType = json['content_type'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['content_type'] = this.contentType;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}
