import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/src/features/customer/about_us/model/about_us_model.dart';
import 'package:groomely/src/features/customer/appointment/model/appointment_list_model.dart';
import 'package:groomely/src/features/customer/our_service_detail/model/our_service_model.dart';
import 'package:groomely/src/features/customer/search/model/all_service_model.dart';
import 'package:groomely/src/features/customer/wish_list/model/wish_list_model.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:groomely/src/utils/storage/local_storage.dart';
import 'package:http/http.dart' as http;

class ApiCallingClass {
  LocalStorageService localStorageService = LocalStorageService();
  Future<bool> bookAppointment(
      {final serviceID,
      final sellerId,
      final bookingDate,
      final bookingTimeId,
      final amount}) async {
    final String authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    if (kDebugMode) {
      print(sellerId);
      print(serviceID);
      print(bookingDate);
      print(bookingTimeId);
      print(amount);
      log(authTokn.toString());
    }
    Map<String, dynamic> body = {
      "service_id": serviceID,
      "seller_id": sellerId,
      "booking_date": bookingDate,
      "booking_time_id": bookingTimeId,
      "amount": amount
    };
    if (kDebugMode) log(body.toString());
    try {
      var response = await http
          .post(Uri.parse(BaseApi.bookAppointment), body: body, headers: {
        'Authorization': 'Bearer $authTokn',
      });
      // var encode = json.encode(response.body);
      var jsonResponse = json.decode(response.body);
      String resMsg = jsonResponse['message'].toString();
      if (kDebugMode) {
        log("APPINTMEN-->${jsonResponse.toString()}");
      }
      if (response.statusCode == 200) {
        var responseData = jsonResponse["data"];
        showToastMessage(resMsg);
        return true;
      } else if (response.statusCode == 401) {
        showToastMessage("shaller does not exist");
        return false;
      } else {
        showToastMessage(resMsg);
        return false;
      }
    } catch (e) {
      log("catch error--> $e");
      return false;
    }
  }

  Future<AppointmentsListModel> getAppointmentListApi() async {
    final authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    print("authToken book-->$authTokn");
    AppointmentsListModel? responseData;
    try {
      var response = await http.post(
          Uri.parse("https://groomely.com/api/v1/users/booking/list"),
          headers: {
            'Authorization': 'Bearer $authTokn',
          });
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        var responseData = AppointmentsListModel.fromJson(decodedData);
        print("response data ---> $responseData");
        return responseData;
      } else {
        print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }

  /// fetch about us data from api
  Future<AboutUsModel> getAboutUsData() async {
    final authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    print("authToken book-->$authTokn");
    AboutUsModel? responseData;
    try {
      var response = await http.get(
        Uri.parse("https://groomely.com/api/v1/cms/about-us"),
      );
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        var responseData = AboutUsModel.fromJson(decodedData);
        print("response data ---> $responseData");
        return responseData;
      } else {
        print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }

  Future<WishListModel> getWishList() async {
    final authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    print("authToken book-->$authTokn");
    WishListModel? responseData;
    try {
      var response = await http.post(
          Uri.parse("https://groomely.com/api/v1/users/wishlist/list"),
          headers: {
            'Authorization': 'Bearer $authTokn',
          });
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        var responseData = WishListModel.fromJson(decodedData);
        print("response data ---> $responseData");
        return responseData;
      } else {
        print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }

  Future<bool> createRemoveWishList({required String serviceId}) async {
    final authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    print("authToken book-->$authTokn");
    try {
      var response = await http.post(
          Uri.parse("https://groomely.com/api/v1/users/wishlist/create"),
          body: {
            "service_id": serviceId
          },
          headers: {
            'Authorization': 'Bearer $authTokn',
          });
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        return decodedData["status"];
      } else {
        print("error" + jsonDecode(response.body)["message"]);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<OurServiceModel> fetchOurServiceDetails(
      {required String serviceType}) async {
    final authTokn =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    print("authToken book-->$authTokn");
    OurServiceModel? responseData;
    try {
      var response = await http.post(
        Uri.parse("https://groomely.com/api/v1/service/list-by-serviceType"),
        body: {"service_type": serviceType},
      );
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        var responseData = OurServiceModel.fromJson(decodedData);
        if (kDebugMode) log(decodedData.toString());
        return responseData;
      } else {
        if (kDebugMode) print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }

  Future<AllServiceModel> fetchAllService() async {
    // final authTokn =
    //     await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN);
    // print("authToken book-->$authTokn");
    AllServiceModel? responseData;
    try {
      var response = await http.get(
        Uri.parse("https://groomely.com/api/v1/service/all-list"),
      );
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        var responseData = AllServiceModel.fromJson(decodedData);
        if (kDebugMode) log(decodedData.toString());
        return responseData;
      } else {
        if (kDebugMode) print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategory() async {
    List<Map<String, dynamic>>? responseData;
    try {
      var response = await http.get(
        Uri.parse("https://groomely.com/api/v1/category/shop-by-category"),
      );
      log("pandey ${response.body.toString()}");
      if (response.statusCode == 200) {
        if (kDebugMode) log("res--> ${response.body}");
        var decodedData = jsonDecode(response.body);
        if (kDebugMode) log(decodedData.toString());
        responseData = decodedData["data"];
        return responseData!;
      } else {
        if (kDebugMode) print("error" + jsonDecode(response.body)["message"]);
        return responseData!;
      }
    } catch (e) {
      return responseData!;
    }
  }
}
