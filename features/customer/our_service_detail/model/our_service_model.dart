class OurServiceModel {
  bool? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  OurServiceModel({this.status, this.statusCode, this.message, this.data});

  OurServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? serviceId;
  int? offerId;
  String? rate;
  int? status;
  String? createdAt;
  String? updatedAt;
  Service? service;

  Data(
      {this.id,
      this.userId,
      this.serviceId,
      this.offerId,
      this.rate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.service});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    offerId = json['offer_id'];
    rate = json['rate'];
    status = json['status'];
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
    data['offer_id'] = offerId;
    data['rate'] = rate;
    data['status'] = status;
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
  AdditionalService? additionalService;
  List<Images>? images;
  List<SellerService>? sellerService;
  List<void>? review;

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
      this.additionalService,
      this.images,
      this.sellerService,
      this.review});

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
    additionalService = json['additional_service'] != null
        ? AdditionalService.fromJson(json['additional_service'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['seller_service'] != null) {
      sellerService = <SellerService>[];
      json['seller_service'].forEach((v) {
        sellerService!.add(SellerService.fromJson(v));
      });
    }
    // if (json['review'] != null) {
    //   review = <Null>[];
    //   json['review'].forEach((v) {
    //     review!.add(new Null.fromJson(v));
    //   });
    // }
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
    if (additionalService != null) {
      data['additional_service'] = additionalService!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (sellerService != null) {
      data['seller_service'] = sellerService!.map((v) => v.toJson()).toList();
    }
    // if (this.review != null) {
    //   data['review'] = this.review!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class AdditionalService {
  int? id;
  String? name;

  AdditionalService({this.id, this.name});

  AdditionalService.fromJson(Map<String, dynamic> json) {
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

class SellerService {
  int? id;
  int? userId;
  int? serviceId;
  int? offerId;
  String? rate;
  int? status;
  String? createdAt;
  String? updatedAt;

  SellerService(
      {this.id,
      this.userId,
      this.serviceId,
      this.offerId,
      this.rate,
      this.status,
      this.createdAt,
      this.updatedAt});

  SellerService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    offerId = json['offer_id'];
    rate = json['rate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['service_id'] = serviceId;
    data['offer_id'] = offerId;
    data['rate'] = rate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
