class AboutUsModel {
  Data? data;
  bool? status;
  String? message;

  AboutUsModel({this.data, this.status, this.message});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? bannerImg;
  String? bannerName;
  String? section1Img;
  String? section1Name;
  String? section1Title;
  String? section1Description;
  String? section2Img;
  String? section2Title;
  String? section3Img;
  String? section3Name;
  String? section3Title;
  String? section3Description;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.bannerImg,
      this.bannerName,
      this.section1Img,
      this.section1Name,
      this.section1Title,
      this.section1Description,
      this.section2Img,
      this.section2Title,
      this.section3Img,
      this.section3Name,
      this.section3Title,
      this.section3Description,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImg = json['banner_img'];
    bannerName = json['banner_name'];
    section1Img = json['section_1_img'];
    section1Name = json['section_1_name'];
    section1Title = json['section_1_title'];
    section1Description = json['section_1_description'];
    section2Img = json['section_2_img'];
    section2Title = json['section_2_title'];
    section3Img = json['section_3_img'];
    section3Name = json['section_3_name'];
    section3Title = json['section_3_title'];
    section3Description = json['section_3_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_img'] = bannerImg;
    data['banner_name'] = bannerName;
    data['section_1_img'] = section1Img;
    data['section_1_name'] = section1Name;
    data['section_1_title'] = section1Title;
    data['section_1_description'] = section1Description;
    data['section_2_img'] = section2Img;
    data['section_2_title'] = section2Title;
    data['section_3_img'] = section3Img;
    data['section_3_name'] = section3Name;
    data['section_3_title'] = section3Title;
    data['section_3_description'] = section3Description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
