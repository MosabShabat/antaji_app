class ServicesModel {
  String? uuid;
  String? name;
  String? categoryName;
  String? workingCondition;
  bool? isNew;
  bool? isSpecial;
  String? cityName;
  String? details;
  String? price;
  String? currency;
  String? created;
  String? from;

  ServicesModel(
      {this.uuid,
      this.name,
      this.categoryName,
      this.workingCondition,
      this.isNew,
      this.isSpecial,
      this.cityName,
      this.details,
      this.price,
      this.currency,
      this.created,
      this.from});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    categoryName = json['category_name'];
    workingCondition = json['working_condition'];
    isNew = json['is_new'];
    isSpecial = json['is_special'];
    cityName = json['city_name'];
    details = json['details'];
    price = json['price'];
    currency = json['currency'];
    created = json['created'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['category_name'] = this.categoryName;
    data['working_condition'] = this.workingCondition;
    data['is_new'] = this.isNew;
    data['is_special'] = this.isSpecial;
    data['city_name'] = this.cityName;
    data['details'] = this.details;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['created'] = this.created;
    data['from'] = this.from;
    return data;
  }
}
