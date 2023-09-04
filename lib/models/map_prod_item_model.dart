class MapProdItem {
  String? uuid;
  String? name;
  String? image;
  String? price;
  String? type;
  String? currency;
  String? lat;
  String? lng;

  MapProdItem(
      {this.uuid,
      this.name,
      this.image,
      this.price,
      this.type,
      this.currency,
      this.lat,
      this.lng});

  MapProdItem.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    type = json['type'];
    currency = json['currency'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['type'] = this.type;
    data['currency'] = this.currency;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
