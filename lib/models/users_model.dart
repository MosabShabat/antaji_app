class UsersModel {
  String? uuid;
  String? type;
  bool? isVerified;
  bool? isFavorite;
  String? name;
  List<Skills>? skills;
  String? lat;
  String? lng;
  String? brief;
  String? specialization;
  String? video;
  String? personalPhoto;
  String? coverPhoto;
  String? createdAt;
  int? reviewsCount;
  String? response;
  List<Reviews>? reviews;
  String? positiveReviews;

  UsersModel(
      {this.uuid,
      this.type,
      this.isVerified,
      this.isFavorite,
      this.name,
      this.skills,
      this.lat,
      this.lng,
      this.brief,
      this.specialization,
      this.video,
      this.personalPhoto,
      this.coverPhoto,
      this.createdAt,
      this.reviewsCount,
      this.response,
      this.reviews,
      this.positiveReviews});

  UsersModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    isVerified = json['is_verified'];
    isFavorite = json['is_favorite'];
    name = json['name'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
    brief = json['brief'];
    specialization = json['specialization'];
    video = json['video'];
    personalPhoto = json['personal_photo'];
    coverPhoto = json['cover_Photo'];
    createdAt = json['created_at'];
    reviewsCount = json['reviews_count'];
    response = json['response'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    positiveReviews = json['positive_reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['is_verified'] = this.isVerified;
    data['is_favorite'] = this.isFavorite;
    data['name'] = this.name;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['brief'] = this.brief;
    data['specialization'] = this.specialization;
    data['video'] = this.video;
    data['personal_photo'] = this.personalPhoto;
    data['cover_Photo'] = this.coverPhoto;
    data['created_at'] = this.createdAt;
    data['reviews_count'] = this.reviewsCount;
    data['response'] = this.response;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['positive_reviews'] = this.positiveReviews;
    return data;
  }
}

class Skills {
  String? nameTranslate;

  Skills({this.nameTranslate});

  Skills.fromJson(Map<String, dynamic> json) {
    nameTranslate = json['name_translate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_translate'] = this.nameTranslate;
    return data;
  }
}

class Reviews {
  String? title;
  String? userName;
  String? userImage;
  String? timeAgo;

  Reviews({this.title, this.userName, this.userImage, this.timeAgo});

  Reviews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userName = json['user_name'];
    userImage = json['user_image'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['time_ago'] = this.timeAgo;
    return data;
  }
}
