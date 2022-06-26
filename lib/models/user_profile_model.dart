// ignore_for_file: prefer_void_to_null

class UserProfile {
  UserProfile({
    required this.data,
    required this.meta,
  });
  late final Data data;
  late final Meta meta;

  UserProfile.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.accessToken,
    required this.user,
  });
  late final String accessToken;
  late final User user;

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.mobile,
    required this.mobileVerifiedAt,
    this.apiToken,
    required this.image,
    required this.address,
    required this.country,
    required this.state,
    required this.role,
    required this.verified,
    required this.lang,
    required this.ltd,
    required this.deviceToken,
    required this.gender,
    this.type,
    this.customerId,
    this.provider,
    this.addedBy,
    required this.rating,
    required this.ratingCount,
    this.rememberToken,
  });
  late final int id;
  late final String username;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String mobile;
  late final bool mobileVerifiedAt;
  late final Null apiToken;
  late final String image;
  late final String address;
  late final String country;
  late final String state;
  late final String role;
  late final int verified;
  late final String lang;
  late final String ltd;
  late final String deviceToken;
  late final int gender;
  late final Null type;
  late final Null customerId;
  late final Null provider;
  late final Null addedBy;
  late final String rating;
  late final int ratingCount;
  late final Null rememberToken;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    mobile = json['mobile'];
    mobileVerifiedAt = json['mobile_verified_at'];
    apiToken = null;
    image = json['image'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    role = json['role'];
    verified = json['verified'];
    lang = json['lang'];
    ltd = json['ltd'];
    deviceToken = json['device_token'];
    gender = json['gender'];
    type = null;
    customerId = null;
    provider = null;
    addedBy = null;
    rating = json['rating'];
    ratingCount = json['ratingCount'] ?? 0;

    rememberToken = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['mobile'] = mobile;
    _data['mobile_verified_at'] = mobileVerifiedAt;
    _data['api_token'] = apiToken;
    _data['image'] = image;
    _data['address'] = address;
    _data['country'] = country;
    _data['state'] = state;
    _data['role'] = role;
    _data['verified'] = verified;
    _data['lang'] = lang;
    _data['ltd'] = ltd;
    _data['device_token'] = deviceToken;
    _data['gender'] = gender;
    _data['type'] = type;
    _data['customer_id'] = customerId;
    _data['provider'] = provider;
    _data['added_by'] = addedBy;
    _data['rating'] = rating;
    _data['ratingCount'] = ratingCount;
    _data['remember_token'] = rememberToken;
    return _data;
  }
}

class Meta {
  Meta({
    required this.message,
    required this.status,
    required this.errors,
  });
  late final String message;
  late final int status;
  late final List<dynamic> errors;

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['errors'] = errors;
    return _data;
  }
}
