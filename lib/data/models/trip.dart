import 'user.dart';

class Trip {
  int? id;
  String? title;
  String? description;
  int? spots;
  int? price;
  String? placeName;
  String? featuredImage;
  String? deeplink;
  String? date;
  int? tagId;
  int? createdBy;
  int? communityId;
  List<Images>? images;
  String? paymentMethod;
  int? viewersCount;
  List<User>? users;
  Tag? tag;

  Trip(
      {this.id,
      this.title,
      this.description,
      this.spots,
      this.price,
      this.placeName,
      this.featuredImage,
      this.deeplink,
      this.date,
      this.tagId,
      this.createdBy,
      this.communityId,
      this.images,
      this.paymentMethod,
      this.viewersCount,
      this.users,
      this.tag});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    spots = json['spots'];
    price = json['price'];
    placeName = json['placeName'];
    featuredImage = json['featuredImage'];
    deeplink = json['deeplink'];
    date = json['date'];
    tagId = json['tagId'];
    createdBy = json['createdBy'];
    communityId = json['communityId'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    paymentMethod = json['paymentMethod'];
    viewersCount = json['viewersCount'];
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(new User.fromJson(v));
      });
    }
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['spots'] = this.spots;
    data['price'] = this.price;
    data['placeName'] = this.placeName;
    data['featuredImage'] = this.featuredImage;
    data['deeplink'] = this.deeplink;
    data['date'] = this.date;
    data['tagId'] = this.tagId;
    data['createdBy'] = this.createdBy;
    data['communityId'] = this.communityId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['paymentMethod'] = this.paymentMethod;
    data['viewersCount'] = this.viewersCount;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.tag != null) {
      data['tag'] = this.tag!.toJson();
    }
    return data;
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Tag {
  int? id;
  String? title;
  String? icon;

  Tag({this.id, this.title, this.icon});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['icon'] = this.icon;
    return data;
  }
}
