import 'package:antaji_app/models/product_of_professionals_model.dart';

class ProductData {
  String? title;
  String? url;
  String? dataType;
  String? type;
  List<ProductDataDet>? dataProductDataDet;
  List<ProductDetails>? dataProductDetails;
  List<ProminentArtists>? dataProminentArtists;
  List<productOfProfessionals>? dataProductOfProfessionals;

  //ProminentArtists

  ProductData({
    this.title,
    this.url,
    this.dataType,
    this.type,
    this.dataProductDataDet,
    this.dataProductDetails,
    this.dataProminentArtists,
    this.dataProductOfProfessionals,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    dataType = json['data_type'];
    type = json['type'];
    if (json['data'] != null) {
      dataProductDataDet = <ProductDataDet>[];
      dataProductDetails = <ProductDetails>[];
      dataProminentArtists = <ProminentArtists>[];
      dataProductOfProfessionals = <productOfProfessionals>[];
      json['data'].forEach((v) {
        dataProductDataDet!.add(new ProductDataDet.fromJson(v));
        dataProductDetails!.add(new ProductDetails.fromJson(v));
        dataProminentArtists!.add(new ProminentArtists.fromJson(v));
        dataProductOfProfessionals!.add(new productOfProfessionals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['data_type'] = this.dataType;
    data['type'] = this.type;
    if (this.dataProductDataDet != null &&
        this.dataProductDetails != null &&
        this.dataProminentArtists != null &&
        this.dataProductOfProfessionals != null) {
      data['data'] = this.dataProductDataDet!.map((v) => v.toJson()).toList();
      data['data'] = this.dataProductDetails!.map((v) => v.toJson()).toList();
      data['data'] = this.dataProminentArtists!.map((v) => v.toJson()).toList();
      data['data'] =
          this.dataProductOfProfessionals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDataDet {
  String? uuid;
  String? nameTranslate;
  String? image;
  int? productCount;

  ProductDataDet(
      {this.uuid, this.nameTranslate, this.image, this.productCount});

  ProductDataDet.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nameTranslate = json['name_translate'];
    image = json['image'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name_translate'] = this.nameTranslate;
    data['image'] = this.image;
    data['product_count'] = this.productCount;
    return data;
  }
}

class ProductDetails {
  String? uuid;
  String? name;
  String? image;
  String? price;
  String? currency;

  ProductDetails({this.uuid, this.name, this.image, this.price, this.currency});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}

class ProminentArtists {
  String? uuid;
  String? specialization;
  String? name;
  String? personalPhoto;
  String? coverPhoto;
  String? video;
  bool? isVerified;
  bool? isFavorite;

  ProminentArtists(
      {this.uuid,
      this.specialization,
      this.name,
      this.personalPhoto,
      this.coverPhoto,
      this.video,
      this.isVerified,
      this.isFavorite});

  ProminentArtists.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    specialization = json['specialization'];
    name = json['name'];
    personalPhoto = json['personal_photo'];
    coverPhoto = json['cover_photo'];
    video = json['video'];
    isVerified = json['is_verified'];
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['specialization'] = this.specialization;
    data['name'] = this.name;
    data['personal_photo'] = this.personalPhoto;
    data['cover_photo'] = this.coverPhoto;
    data['video'] = this.video;
    data['is_verified'] = this.isVerified;
    data['is_favorite'] = this.isFavorite;
    return data;
  }
}
