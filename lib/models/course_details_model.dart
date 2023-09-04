class CourseDetailsModel {
  String? uuid;
  String? name;
  String? details;
  bool? isPurchased;
  String? price;
  String? currency;
  String? demonstrationVideo;
  int? count;
  List<Videos>? videos;
  Owner? owner;

  CourseDetailsModel(
      {this.uuid,
      this.name,
      this.details,
      this.isPurchased,
      this.price,
      this.currency,
      this.demonstrationVideo,
      this.count,
      this.videos,
      this.owner});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    details = json['details'];
    isPurchased = json['is_purchased'];
    price = json['price'];
    currency = json['currency'];
    demonstrationVideo = json['demonstration_video'];
    count = json['count'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['details'] = this.details;
    data['is_purchased'] = this.isPurchased;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['demonstration_video'] = this.demonstrationVideo;
    data['count'] = this.count;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Videos {
  String? uuid;
  String? attachment;
  String? duration;

  Videos({this.uuid, this.attachment, this.duration});

  Videos.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    attachment = json['attachment'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['attachment'] = this.attachment;
    data['duration'] = this.duration;
    return data;
  }
}

class Owner {
  String? uuid;
  String? name;
  String? image;
  String? specialization;

  Owner({this.uuid, this.name, this.image, this.specialization});

  Owner.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
    specialization = json['specialization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['specialization'] = this.specialization;
    return data;
  }
}
