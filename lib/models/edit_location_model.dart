class EditLocationModel {
  Item? item;

  EditLocationModel({this.item});

  EditLocationModel.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  String? uuid;
  String? name;
  String? details;
  String? price;
  List<Categories>? categories;
  String? lat;
  String? lng;
  String? address;
  List<Images>? images;
  String? currency;

  Item(
      {this.uuid,
      this.name,
      this.details,
      this.price,
      this.categories,
      this.lat,
      this.lng,
      this.address,
      this.images,
      this.currency});

  Item.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['currency'] = this.currency;
    return data;
  }
}

class Categories {
  String? uuid;
  String? nameTranslate;

  Categories({this.uuid, this.nameTranslate});

  Categories.fromJson(Map<String, dynamic> json) {
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

class Images {
  String? uuid;
  String? attachment;

  Images({this.uuid, this.attachment});

  Images.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['attachment'] = this.attachment;
    return data;
  }
}
