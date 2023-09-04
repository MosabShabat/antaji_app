import 'package:antaji_app/models/product_details_model.dart';

class LocationsModel {
  String? uuid;
  String? name;
  String? image;
  String? price;
  String? currency;
  bool? isFavorite;
  List<Attachments>? attachments;
  String? details;
  String? lat;
  String? lng;
  Owner? owner;

  LocationsModel(
      {this.uuid,
      this.name,
      this.image,
      this.price,
      this.currency,
      this.isFavorite,
      this.attachments,
      this.details,
      this.lat,
      this.lng,
      this.owner});

  LocationsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    currency = json['currency'];
    isFavorite = json['is_favorite'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    details = json['details'];
    lat = json['lat'];
    lng = json['lng'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['is_favorite'] = this.isFavorite;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['details'] = this.details;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}
