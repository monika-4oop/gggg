import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/constants/colors.dart';

import 'package:groomely/src/utils/device_size_config.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentDetails extends StatefulWidget {
  var appointmentId;
  AppointmentDetails({
    super.key,
    this.appointmentId,
  });

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  var authToken;
  var _userData;
  var response;
  var appointmentDetailsData;
  @override
  void initState() {
    super.initState();
    setState(() {
      getUserData();
    });
  }

  getUserData() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          String? stringValue = prefs.getString('userData');
          _userData = jsonDecode(stringValue!)["data"];
          authToken = _userData['auth_token'];
          getAppointmentDetails(authToken);
          // setState(() {

          // });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              IconButton(
                icon: const ImageIcon(
                  AssetImage('assets/icons/back_round.png'),
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          title: Text(
            "Appointment Details",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 16.0,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Appointment Details",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.0,
                          color: colorPrimaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.width * 70 / 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        //second row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "User Name :",
                                    style: TextStyle(
                                      color: Color(0xff6c757d),
                                      fontSize: 15.0,
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : appointmentDetailsData["name"]!
                                          .toString(),
                                  //appointmentDetailsData["name"]!.toString(),
                                  // "Shop name",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //third row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "User Email :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : appointmentDetailsData["email"]!
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //four Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "User Phone Number :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : appointmentDetailsData["phone"]!
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Appointment Date :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : appointmentDetailsData["booking_date"]!
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Appointment Time :",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : appointmentDetailsData["booking_time"]
                                              ["time"]!
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Amount :",
                                    style: TextStyle(
                                      color: Color(0xff6c757d),
                                      fontSize: 15.0,
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '\$${appointmentDetailsData["amount"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Staus :",
                                    style: TextStyle(
                                      color: Color(0xff6c757d),
                                      fontSize: 15.0,
                                    ),
                                  )),
                              // Spacer(),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["status"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        // second row
                      ]),
                ),
              ),
            ),
            // second card
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Barber Details",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.0,
                          color: colorPrimaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.width * 70 / 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        //second row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Shop Name :",
                                    style: TextStyle(
                                      color: Color(0xff6c757d),
                                      fontSize: 15.0,
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["seller"]["shop_name"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //third row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Barber Name :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["seller"]["name"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //four Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Barber Email :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["seller"]["email"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Barber Phone Number:",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["seller"]["phone"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        // second row
                      ]),
                ),
              ),
            ),
            // 3rd row end

            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service Details",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.0,
                          color: colorPrimaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.width * 70 / 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        //second row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Service Name :",
                                    style: TextStyle(
                                      color: Color(0xff6c757d),
                                      fontSize: 15.0,
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["service"]["additional_service"]["name"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //third row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Service Category: :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["service"]["category"]["name"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //four Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: 5.0),
                                  child: const Text(
                                    "Duration :",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff6c757d),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Text(
                                  appointmentDetailsData == null
                                      ? ''
                                      : '${appointmentDetailsData["service"]["duration"]!}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff212529),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        // second row
                      ]),
                ),
              ),
            ),
          ],
        ));
  }

  getAppointmentDetails(authToken) async {
    try {
      Map data = {'appointment_id': widget.appointmentId};
      response = await http
          .post(Uri.parse(BaseApi.getBookingDetailsApi), body: data, headers: {
        'Authorization': 'Bearer ${authToken.toString()}',
      });
      if (response.statusCode == 200) {
        setState(() {
          appointmentDetailsData = jsonDecode(response.body)["data"];
        });
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
}
