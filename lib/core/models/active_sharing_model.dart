class ActiveSharingResponse {
  ActiveSharing? activeSharing;

  ActiveSharingResponse({this.activeSharing});

  ActiveSharingResponse.fromJson(Map<String, dynamic> json) {
    activeSharing = json['activeSharing'] != null
        ? ActiveSharing.fromJson(json['activeSharing'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (activeSharing != null) {
      data['activeSharing'] = activeSharing!.toJson();
    }
    return data;
  }
}

class ActiveSharing {
  int? userId;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;

  ActiveSharing(
      {this.userId, this.type, this.updatedAt, this.createdAt, this.id});

  ActiveSharing.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['type'] = type;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
