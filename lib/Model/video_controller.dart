class VideoModel {
  String? status;
  String? message;
  Data? data;

  VideoModel({this.status, this.message, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? kioskId;
  String? locationId;
  String? locationName;
  String? contactName;
  String? address;
  String? town;
  String? postCode;
  String? telephone;
  String? contactPhone;
  String? contactEmail;
  String? organization;
  String? type;
  String? device;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  List<Subscriptions>? subscriptions;

  Data(
      {this.id,
        this.kioskId,
        this.locationId,
        this.locationName,
        this.contactName,
        this.address,
        this.town,
        this.postCode,
        this.telephone,
        this.contactPhone,
        this.contactEmail,
        this.organization,
        this.type,
        this.device,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.subscriptions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kioskId = json['kiosk_id'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    contactName = json['contact_name'];
    address = json['address'];
    town = json['town'];
    postCode = json['post_code'];
    telephone = json['telephone'];
    contactPhone = json['contact_phone'];
    contactEmail = json['contact_email'];
    organization = json['organization'];
    type = json['type'];
    device = json['device'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kiosk_id'] = kioskId;
    data['location_id'] = locationId;
    data['location_name'] = locationName;
    data['contact_name'] = contactName;
    data['address'] = address;
    data['town'] = town;
    data['post_code'] = postCode;
    data['telephone'] = telephone;
    data['contact_phone'] = contactPhone;
    data['contact_email'] = contactEmail;
    data['organization'] = organization;
    data['type'] = type;
    data['device'] = device;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subscriptions != null) {
      data['subscriptions'] =
          subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptions {
  String? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Videos>? videos;

  Subscriptions(
      {this.id,
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.videos});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = this.description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  String? kioskId;
  String? subscriptionId;
  String? createdAt;
  String? updatedAt;

  Pivot({this.kioskId, this.subscriptionId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    kioskId = json['kiosk_id'];
    subscriptionId = json['subscription_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kiosk_id'] = kioskId;
    data['subscription_id'] = subscriptionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Videos {
  String? id;
  String? title;
  String? description;
  String? path;
  int? videoTier;
  Null? videoThumbnail;
  String? videoOrientation;
  String? imageOne;
  String? imageTwo;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<InteractionPoints>? interactionPoints;

  Videos(
      {this.id,
        this.title,
        this.description,
        this.path,
        this.videoTier,
        this.videoThumbnail,
        this.videoOrientation,
        this.imageOne,
        this.imageTwo,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.interactionPoints});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    path = json['path'];
    videoTier = json['video_tier'];
    videoThumbnail = json['video_thumbnail'];
    videoOrientation = json['video_orientation'];
    imageOne = json['image_one'];
    imageTwo = json['image_two'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['interaction_points'] != null) {
      interactionPoints = <InteractionPoints>[];
      json['interaction_points'].forEach((v) {
        interactionPoints!.add(InteractionPoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['path'] = path;
    data['video_tier'] = videoTier;
    data['video_thumbnail'] = videoThumbnail;
    data['video_orientation'] = videoOrientation;
    data['image_one'] = imageOne;
    data['image_two'] = imageTwo;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    if (interactionPoints != null) {
      data['interaction_points'] =
          interactionPoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot1 {
  String? subscriptionId;
  String? videoId;
  String? createdAt;
  String? updatedAt;

  Pivot1({this.subscriptionId, this.videoId, this.createdAt, this.updatedAt});

  Pivot1.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    videoId = json['video_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_id'] = subscriptionId;
    data['video_id'] = videoId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class InteractionPoints {
  String? id;
  String? videoId;
  String? triggerName;
  String? text;
  String? path;
  Null? name;
  Null? email;
  Null? phone;
  Null? message;
  String? time;
  String? duration;
  int? type;
  Null? contactTerms;
  String? createdAt;
  String? updatedAt;

  InteractionPoints(
      {this.id,
        this.videoId,
        this.triggerName,
        this.text,
        this.path,
        this.name,
        this.email,
        this.phone,
        this.message,
        this.time,
        this.duration,
        this.type,
        this.contactTerms,
        this.createdAt,
        this.updatedAt});

  InteractionPoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    triggerName = json['trigger_name'];
    text = json['text'];
    path = json['path'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    message = json['message'];
    time = json['time'];
    duration = json['duration'];
    type = json['type'];
    contactTerms = json['contact_terms'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_id'] = videoId;
    data['trigger_name'] = triggerName;
    data['text'] = text;
    data['path'] = path;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['message'] = message;
    data['time'] = time;
    data['duration'] = duration;
    data['type'] = type;
    data['contact_terms'] = contactTerms;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}