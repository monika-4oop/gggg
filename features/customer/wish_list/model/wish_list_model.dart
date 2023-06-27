class WishListModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  WishListModel({this.status, this.statusCode, this.message, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Wishlist>? wishlist;

  Data({this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wishlist != null) {
      data['wishlist'] = wishlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  int? id;
  int? userId;
  int? serviceId;
  String? createdAt;
  String? updatedAt;
  Service? service;

  Wishlist(
      {this.id,
      this.userId,
      this.serviceId,
      this.createdAt,
      this.updatedAt,
      this.service});

  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['service_id'] = serviceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    return data;
  }
}

class Service {
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
  AdditionalService? additionalService;

  Service(
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
      this.additionalService});

  Service.fromJson(Map<String, dynamic> json) {
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
        ? AdditionalService.fromJson(json['additional_service'])
        : null;
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
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? status;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.status,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AdditionalService {
  int? id;
  int? serviceTypeId;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  AdditionalService(
      {this.id,
      this.serviceTypeId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  AdditionalService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceTypeId = json['service_type_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_type_id'] = serviceTypeId;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
