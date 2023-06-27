class AllServiceModel {
  List<Data>? data;
  bool? status;
  String? message;

  AllServiceModel({this.data, this.status, this.message});

  AllServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  int? serviceTypeId;
  int? additionalServiceId;
  int? offerId;
  String? duration;
  String? description;
  int? status;
  int? popularServices;
  String? createdAt;
  String? updatedAt;
  Category? category;
  Category? additionalService;
  List<Review>? review;
  List<Images>? images;

  Data(
      {this.id,
      this.categoryId,
      this.serviceTypeId,
      this.additionalServiceId,
      this.offerId,
      this.duration,
      this.description,
      this.status,
      this.popularServices,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.additionalService,
      this.review,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    serviceTypeId = json['service_type_id'];
    additionalServiceId = json['additional_service_id'];
    offerId = json['offer_id'];
    duration = json['duration'];
    description = json['description'];
    status = json['status'];
    popularServices = json['popular_services'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    additionalService = json['additional_service'] != null
        ? Category.fromJson(json['additional_service'])
        : null;
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['service_type_id'] = serviceTypeId;
    data['additional_service_id'] = additionalServiceId;
    data['offer_id'] = offerId;
    data['duration'] = duration;
    data['description'] = description;
    data['status'] = status;
    data['popular_services'] = popularServices;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (additionalService != null) {
      data['additional_service'] = additionalService!.toJson();
    }
    if (review != null) {
      data['review'] = review!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Review {
  int? id;
  int? appointmentId;
  int? userId;
  int? serviceId;
  String? comment;
  String? rating;
  String? createdAt;
  String? updatedAt;

  Review(
      {this.id,
      this.appointmentId,
      this.userId,
      this.serviceId,
      this.comment,
      this.rating,
      this.createdAt,
      this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointment_id'] = appointmentId;
    data['user_id'] = userId;
    data['service_id'] = serviceId;
    data['comment'] = comment;
    data['rating'] = rating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Images {
  int? id;
  int? serviceId;
  String? sliderImage;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.serviceId,
      this.sliderImage,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    sliderImage = json['slider_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['slider_image'] = sliderImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
