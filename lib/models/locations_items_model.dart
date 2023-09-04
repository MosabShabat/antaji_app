import 'package:antaji_app/models/map_model.dart';
import 'package:antaji_app/models/product_data.dart';

class locationsItemsModel {
  List<ProductDetails>? items;
  List<Categories>? categories;

  locationsItemsModel({this.items, this.categories});

  locationsItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ProductDetails>[];
      json['items'].forEach((v) {
        items!.add(new ProductDetails.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

