class ProfileModel {
  String? uuid;
  String? type;
  String? address;
  String? name;
  bool? isVerified;
  String? lat;
  String? lng;
  String? brief;
  String? video;
  String? personalPhoto;
  String? coverPhoto;

  ProfileModel(
      {this.uuid,
      this.type,
      this.address,
      this.name,
      this.isVerified,
      this.lat,
      this.lng,
      this.brief,
      this.video,
      this.personalPhoto,
      this.coverPhoto});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    address = json['address'];
    name = json['name'];
    isVerified = json['is_verified'];
    lat = json['lat'];
    lng = json['lng'];
    brief = json['brief'];
    video = json['video'];
    personalPhoto = json['personal_photo'];
    coverPhoto = json['cover_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['address'] = this.address;
    data['name'] = this.name;
    data['is_verified'] = this.isVerified;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['brief'] = this.brief;
    data['video'] = this.video;
    data['personal_photo'] = this.personalPhoto;
    data['cover_photo'] = this.coverPhoto;
    return data;
  }
}
