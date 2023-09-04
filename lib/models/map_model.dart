import 'package:antaji_app/models/map_prod_item_model.dart';

class MapModel {
  List<Categories>? categories;
  List<MapProdItem>? items;

  MapModel({this.categories, this.items});

  MapModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <MapProdItem>[];
      json['items'].forEach((v) {
        items!.add(new MapProdItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
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

