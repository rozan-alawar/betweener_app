class AuthResponse {
  String? message;
  User? user;
  String? token;

  AuthResponse({this.message, this.user, this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  String? country;
  String? ip;
  double? long;
  double? lat;
  String? fcm;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.country,
      this.ip,
      this.long,
      this.lat,
      this.fcm});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    long = json['long'];
    lat = json['lat'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['isActive'] = isActive;
    data['country'] = country;
    data['ip'] = ip;
    data['long'] = long;
    data['lat'] = lat;
    data['fcm'] = fcm;
    return data;
  }
}
