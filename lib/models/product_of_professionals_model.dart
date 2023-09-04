class productOfProfessionals {
  String? image;
  String? title;
  String? artistName;
  String? artistImage;

  productOfProfessionals(
      {this.image, this.title, this.artistName, this.artistImage});

  productOfProfessionals.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    artistName = json['artist_name'];
    artistImage = json['artist_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['artist_name'] = this.artistName;
    data['artist_image'] = this.artistImage;
    return data;
  }
}
