class ProductDetailsModel {
  String? uuid;
  String? name;
  String? image;
  String? contentType;
  bool? isFavorite;
  String? price;
  String? currency;
  String? type;
  List<Attachments>? attachments;
  String? details;
  List<Specifications>? specifications;
  String? lat;
  String? lng;
  Owner? owner;

  ProductDetailsModel(
      {this.uuid,
      this.name,
      this.image,
      this.contentType,
      this.isFavorite,
      this.price,
      this.currency,
      this.type,
      this.attachments,
      this.details,
      this.specifications,
      this.lat,
      this.lng,
      this.owner});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    contentType = json['content_type'];
    isFavorite = json['is_favorite'];
    price = json['price'];
    currency = json['currency'];
    type = json['type'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    details = json['details'];
    if (json['specifications'] != null) {
      specifications = <Specifications>[];
      json['specifications'].forEach((v) {
        specifications!.add(new Specifications.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['content_type'] = this.contentType;
    data['is_favorite'] = this.isFavorite;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['type'] = this.type;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['details'] = this.details;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Attachments {
  String? uuid;
  String? attachment;

  Attachments({this.uuid, this.attachment});

  Attachments.fromJson(Map<String, dynamic> json) {
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

class Specifications {
  String? uuid;
  String? key;
  String? value;

  Specifications({this.uuid, this.key, this.value});

  Specifications.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Owner {
  String? uuid;
  String? name;
  String? image;
  int? productsCount;

  Owner({this.uuid, this.name, this.image, this.productsCount});

  Owner.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['products_count'] = this.productsCount;
    return data;
  }
}
