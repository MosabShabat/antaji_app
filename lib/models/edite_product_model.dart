import 'package:antaji_app/models/product_details_model.dart';

class EditProductModel {
  Item? item;

  EditProductModel({this.item});

  EditProductModel.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? name;
  String? price;
  String? categoryUuid;
  String? categoryName;
  String? subCategoryUuid;
  String? subCategoryName;
  String? details;
  String? lat;
  String? lng;
  String? address;
  List<Specifications>? specifications;
  List<Attachments>? images;
  String? currency;

  Item(
      {this.uuid,
      this.type,
      this.name,
      this.price,
      this.categoryUuid,
      this.categoryName,
      this.subCategoryUuid,
      this.subCategoryName,
      this.details,
      this.lat,
      this.lng,
      this.address,
      this.specifications,
      this.images,
      this.currency});

  Item.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    name = json['name'];
    price = json['price'];
    categoryUuid = json['category_uuid'];
    categoryName = json['category_name'];
    subCategoryUuid = json['sub_category_uuid'];
    subCategoryName = json['sub_category_name'];
    details = json['details'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    if (json['specifications'] != null) {
      specifications = <Specifications>[];
      json['specifications'].forEach((v) {
        specifications!.add(new Specifications.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Attachments>[];
      json['images'].forEach((v) {
        images!.add(new Attachments.fromJson(v));
      });
    }
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['name'] = this.name;
    data['price'] = this.price;
    data['category_uuid'] = this.categoryUuid;
    data['category_name'] = this.categoryName;
    data['sub_category_uuid'] = this.subCategoryUuid;
    data['sub_category_name'] = this.subCategoryName;
    data['details'] = this.details;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['currency'] = this.currency;
    return data;
  }
}


