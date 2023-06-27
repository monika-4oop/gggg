import 'dart:convert';
import 'dart:developer';
// ignore: use_build_context_synchronously
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/src/features/seller/widget/bottom_navigation_bar.dart';
import 'package:groomely/src/routing/routing_config.dart';
import 'package:groomely/src/utils/device_size_config.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:groomely/src/utils/storage/local_storage.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget with ChangeNotifier {
  bool isSlot;
  SignInScreen({super.key, this.isSlot = false});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Box<dynamic> settingsBox = Hive.box('settings');

  String groupValue = "USER";

  bool isTextObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LocalStorageService localStorageService = LocalStorageService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/authImage.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Text(
                "Find Your Barber to Get Better Looks",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 0.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorRadius: const Radius.circular(0.8),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFF616161)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFF616161)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFFD5A353)),
                      ),
                      hintText: 'Email Address',
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  //  const PasswordField(),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: isTextObscure,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFF616161)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFF616161)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.solid,
                            color: Color(0XFFD5A353)),
                      ),
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextObscure = !isTextObscure;
                          });
                        },
                        child: isTextObscure
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Your Password?",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: const Color(0XFFD5A353)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Are You"),
                      const SizedBox(width: 20),
                      Radio(
                          value: "BUSINESS_OWNER",
                          groupValue: groupValue,
                          onChanged: (v) {
                            setState(() {
                              groupValue = v.toString();
                            });
                          }),
                      const Text("Seller"),
                      const SizedBox(width: 20),
                      Radio(
                          value: "USER",
                          groupValue: groupValue,
                          onChanged: (v) {
                            setState(() {
                              groupValue = v.toString();
                            });
                          }),
                      const Text("customer"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   appHomeScreen,
                    //   (Route<dynamic> route) => false,
                    // );

                    if (_formKey.currentState!.validate()) {
                      loginData(context, emailController.text,
                          _passwordController.text, groupValue);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD5A353),
                    foregroundColor: Colors.white,
                    elevation: 0.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      deviceSizeConfig.blockSizeVertical * 6.5,
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Don’t Have an Account?",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0XFF1E1E1E)),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(signUpScreen);
                  },
                  child: Text(
                    "SIGNUP NOW",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0XFFD5A353)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginData(BuildContext context, String stEmail,
      String stPassword, String groupValue) async {
    // var settingsBox = await Hive.openBox('settings');
    if (kDebugMode) {
      print(stEmail);
      print(stPassword);
    }

    Map<String, dynamic> data = {
      'email': stEmail.trim(),
      'password': stPassword.trim(),
      'user_type': groupValue.trim(),
    };
    var response = await http.post(Uri.parse(BaseApi.loginUserApi), body: data);
    var jsonResponse = json.decode(response.body);
    var resMsg = jsonResponse['message'];
    // log(jsonResponse['data']['auth_token'].toString());
    if (response.statusCode == 200) {
      showToastMessage(resMsg);
      final authToken = jsonResponse['data']['auth_token'].toString();
      print("authToken ---> $authToken");

      localStorageService.saveToDisk(
          LocalStorageService.AUTH_TOKEN, authToken.trim());
      localStorageService.saveToDisk(LocalStorageService.USER_ID,
          jsonResponse['data']['user']['id'].toString().trim());
      localStorageService.saveToDisk(LocalStorageService.USER_NAME,
          jsonResponse['data']['user']['name'].toString().trim());
      localStorageService.saveToDisk(LocalStorageService.USER_EMAIL,
          jsonResponse['data']['user']['email'].toString().trim());
      localStorageService.saveToDisk(LocalStorageService.USER_PHONE,
          jsonResponse['data']['user']['phone'].toString().trim());
      log("isSlot ---> ${widget.isSlot}");
      if (widget.isSlot) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        groupValue == "BUSINESS_OWNER"
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MainScreenWithBottomNavigationBar()),
                (route) => false)
            : Navigator.of(context).pushNamedAndRemoveUntil(
                appHomeScreen,
                (Route<dynamic> route) => false,
              );
      }

      //}
    } else {
      showToastMessage(resMsg);
    }
  }
}
