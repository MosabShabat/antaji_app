class MyCoursesModel {
  String? uuid;
  String? name;
  String? cover;
  int? count;
  String? userName;
  String? userImage;

  MyCoursesModel(
      {this.uuid,
      this.name,
      this.cover,
      this.count,
      this.userName,
      this.userImage});

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    cover = json['cover'];
    count = json['count'];
    userName = json['user_name'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['count'] = this.count;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    return data;
  }
}
