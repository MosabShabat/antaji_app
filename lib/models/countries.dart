class Countries {
  String? uuid;
  String? key;
  String? nameTranslate;
  String? image;
  List<Cities>? cities;

  Countries({this.uuid, this.key, this.nameTranslate, this.image, this.cities});

  Countries.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    key = json['key'];
    nameTranslate = json['name_translate'];
    image = json['image'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['key'] = this.key;
    data['name_translate'] = this.nameTranslate;
    data['image'] = this.image;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? uuid;
  String? nameTranslate;
  String? countryName;

  Cities({this.uuid, this.nameTranslate, this.countryName});

  Cities.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nameTranslate = json['name_translate'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name_translate'] = this.nameTranslate;
    data['country_name'] = this.countryName;
    return data;
  }
}
