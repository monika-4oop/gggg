import 'dart:core';

class BaseApi {
  static const String imageUrl = 'https://groomely.com/public/storage/';
  static const String baseUrl = 'https://groomely.com';
  static const String apiVersion = '/api/v1';
  static const String loginUserApi = '$baseUrl$apiVersion/users/login';
  static const String registerUserApi = '$baseUrl$apiVersion/users/register';
  static const String forgotPasswordApi =
      '$baseUrl$apiVersion/users/forget-password';
  static const String getCategoriesApi = '$baseUrl$apiVersion/category/list';
  static const String getCategoriesByServiceApi =
      '$baseUrl$apiVersion/category/service-types';
  static const String getServicesTypesApi = '$baseUrl$apiVersion/service/types';
  static const String getServicesListApi = '$baseUrl$apiVersion/service/list';
  static const String getServicesDetailsApi =
      '$baseUrl$apiVersion/service/details';
  static const String getAppointmentBookingTimesApi =
      '$baseUrl$apiVersion/appointment/booking-times';
  static const String getServiceHomeApi = '$baseUrl$apiVersion/home/list';
  static const String getBestSellersApi =
      '$baseUrl$apiVersion/home/best-sellers';
  static const String getPopularServicesApi =
      '$baseUrl$apiVersion/service/populars';
  static const String getListbyServiceTypeApi =
      '$baseUrl$apiVersion/service/list-by-serviceType';
  static const String getBookingApi =
      '$baseUrl$apiVersion/users/booking/create';
  static const String getBookingListApi =
      '$baseUrl$apiVersion/users/booking/list';
  static const String getBookingDetailsApi =
      '$baseUrl$apiVersion/users/booking/details';
  static const String userUpdateProfile =
      '$baseUrl$apiVersion/users/profile/update';
  static const String userChangePassword =
      '$baseUrl$apiVersion/users/profile/change-password';
  // after changing the base url
  static const String bookAppointment =
      "$baseUrl$apiVersion/users/booking/create";
}
