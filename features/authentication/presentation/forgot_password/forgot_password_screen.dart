import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/constants/colors.dart';
import 'package:groomely/src/routing/routing_config.dart';
import 'package:groomely/src/utils/device_size_config.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget with ChangeNotifier {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //const SignInScreen({super.key});
  var jsonResponse;
  var resMsg;
  bool isTextObscure = true;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    return Scaffold(
      body: Form(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 85.0,
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 0.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: deviceSizeConfig.blockSizeVertical * 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'GROOMELY',
                              style: GoogleFonts.sanchez(
                                color: colorGoldenYellow,
                                fontSize: 25.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                            Text(
                              'APPOINTMENTS MADE EASY',
                              style: GoogleFonts.teko(
                                color: colorPrimaryBlack,
                                fontSize: 18.0,
                                letterSpacing: 2.25,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceSizeConfig.blockSizeVertical * 4.0,
                  ),
                  Text(
                    'FORGET YOUR PASSWORD',
                    style: GoogleFonts.teko(
                      color: colorPrimaryBlack,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorRadius: const Radius.circular(0.8),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      forgotPasswordData(
                        context,
                        emailController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimaryBlack,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        deviceSizeConfig.blockSizeVertical * 6.5,
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.25,
                      ),
                    ),
                    child: const Text(
                      'Send reset password link',
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(signInScreen);
                        },
                        child: Text(
                          'Sign In',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: colorPrimaryBlack,
                                    fontSize: 15.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  forgotPasswordData(BuildContext context, String stEmail) async {
    Map data = {'email': stEmail};
    http.Response response =
        await http.post(Uri.parse(BaseApi.forgotPasswordApi), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      String dataStatus = jsonResponse['status'].toString();
      resMsg = jsonResponse['message'];
      showToastMessage(resMsg);
      Navigator.of(context).pushNamed(signInScreen);
    } else {
      showToastMessage("Couldn't find your account!");
    }
  }
}
