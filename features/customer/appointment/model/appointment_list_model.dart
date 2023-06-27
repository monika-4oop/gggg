class AppointmentsListModel {
  List<Data>? data;
  bool? status;
  String? message;

  AppointmentsListModel({this.data, this.status, this.message});

  AppointmentsListModel.fromJson(Map<String, dynamic> json) {
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
  int? sellerId;
  String? bookingDate;
  int? bookingTimeId;
  String? amount;
  int? serviceId;
  String? status;
  Seller? seller;
  Service? service;
  BookingTime? bookingTime;

  Data(
      {this.id,
      this.sellerId,
      this.bookingDate,
      this.bookingTimeId,
      this.amount,
      this.serviceId,
      this.status,
      this.seller,
      this.service,
      this.bookingTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    bookingDate = json['booking_date'];
    bookingTimeId = json['booking_time_id'];
    amount = json['amount'];
    serviceId = json['service_id'];
    status = json['status'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    bookingTime = json['booking_time'] != null
        ? BookingTime.fromJson(json['booking_time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['booking_date'] = bookingDate;
    data['booking_time_id'] = bookingTimeId;
    data['amount'] = amount;
    data['service_id'] = serviceId;
    data['status'] = status;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (service != null) {
      data['service'] = service!.toJson();
    }
    if (bookingTime != null) {
      data['booking_time'] = bookingTime!.toJson();
    }
    return data;
  }
}

class Seller {
  int? id;
  String? name;
  String? shopName;
  String? email;
  String? phone;
  String? zipcode;
  String? shopAddress;
  dynamic emailVerifiedAt;
  String? profilePicture;
  dynamic socialType;
  int? status;
  int? loginStatus;
  dynamic googleId;
  dynamic facebookId;
  String? passwordUpdateTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Seller(
      {this.id,
      this.name,
      this.shopName,
      this.email,
      this.phone,
      this.zipcode,
      this.shopAddress,
      this.emailVerifiedAt,
      this.profilePicture,
      this.socialType,
      this.status,
      this.loginStatus,
      this.googleId,
      this.facebookId,
      this.passwordUpdateTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shopName = json['shop_name'];
    email = json['email'];
    phone = json['phone'];
    zipcode = json['zipcode'];
    shopAddress = json['shop_address'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    socialType = json['social_type'];
    status = json['status'];
    loginStatus = json['login_status'];
    googleId = json['google_id'];
    facebookId = json['facebook_id'];
    passwordUpdateTime = json['password_update_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shop_name'] = shopName;
    data['email'] = email;
    data['phone'] = phone;
    data['zipcode'] = zipcode;
    data['shop_address'] = shopAddress;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_picture'] = profilePicture;
    data['social_type'] = socialType;
    data['status'] = status;
    data['login_status'] = loginStatus;
    data['google_id'] = googleId;
    data['facebook_id'] = facebookId;
    data['password_update_time'] = passwordUpdateTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
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
  List<SellerService>? sellerService;

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
      this.sellerService});

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
    if (json['seller_service'] != null) {
      sellerService = <SellerService>[];
      json['seller_service'].forEach((v) {
        sellerService!.add(SellerService.fromJson(v));
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
    if (additionalService != null) {
      data['additional_service'] = additionalService!.toJson();
    }
    if (sellerService != null) {
      data['seller_service'] = sellerService!.map((v) => v.toJson()).toList();
    }
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

class SellerService {
  int? id;
  int? userId;
  int? serviceId;
  int? offerId;
  String? rate;
  int? status;
  String? createdAt;
  String? updatedAt;
  Offer? offer;

  SellerService(
      {this.id,
      this.userId,
      this.serviceId,
      this.offerId,
      this.rate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.offer});

  SellerService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    offerId = json['offer_id'];
    rate = json['rate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
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
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    return data;
  }
}

class Offer {
  int? id;
  String? offerAmount;
  String? offerImage;
  String? createdAt;
  String? updatedAt;

  Offer(
      {this.id,
      this.offerAmount,
      this.offerImage,
      this.createdAt,
      this.updatedAt});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerAmount = json['offer_amount'];
    offerImage = json['offer_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_amount'] = offerAmount;
    data['offer_image'] = offerImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class BookingTime {
  int? id;
  String? time;

  BookingTime({this.id, this.time});

  BookingTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    return data;
  }
}
