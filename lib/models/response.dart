
class Response<T> {
  bool? status;
  String? message;
  T? data; 
  T? pages;

  Response({
    this.status,
    this.message,
    required this.data, 
    this.pages,
  });

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    data['pages'] = pages;

    return data;
  }
}
