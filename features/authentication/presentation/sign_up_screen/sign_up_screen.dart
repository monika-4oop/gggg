import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/src/features/seller/widget/bottom_navigation_bar.dart';
import 'package:groomely/src/routing/routing_config.dart';
import 'package:groomely/src/utils/device_size_config.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/storage/local_storage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  // SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isTextObscure = true;
  bool isTextObscure2 = true;
  String groupValue = "USER";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _last_nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  LocalStorageService localStorageService = LocalStorageService();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _last_nameController.dispose();
    _emailController.dispose();
    _phonenoController.dispose();
    _zipCodeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
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
                "Signup to Explore More",
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
                bottom: 8.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    //textInputAction: TextInputAction.next,
                    cursorRadius: const Radius.circular(0.8),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),

                    decoration: InputDecoration(
                      hintText: 'First Name',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                    controller: _last_nameController,
                    keyboardType: TextInputType.text,
                    cursorRadius: const Radius.circular(0.8),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      hintText: 'Last Name',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorRadius: const Radius.circular(0.8),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      hintText: 'Email Address',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                    controller: _phonenoController,
                    keyboardType: TextInputType.number,
                    cursorRadius: const Radius.circular(0.8),
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Zip Code';
                      }
                      return null;
                    },
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    controller: _zipCodeController,
                    keyboardType: TextInputType.number,
                    cursorRadius: const Radius.circular(0.8),
                    decoration: InputDecoration(
                      hintText: 'Zip Code',
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
                    ),
                  ),
                  // const SizedBox(

                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    cursorRadius: const Radius.circular(0.8),
                    obscureText: isTextObscure,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextObscure = !isTextObscure;
                          });
                        },
                        child: isTextObscure == true
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
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
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.text,
                    cursorRadius: const Radius.circular(0.8),
                    obscureText: isTextObscure2,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF1E1E1E)),
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextObscure2 = !isTextObscure2;
                          });
                        },
                        child: isTextObscure2
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
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
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
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
              height: 5.0,
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
                      signUpData(
                          context,
                          _nameController.text,
                          _last_nameController.text,
                          _emailController.text,
                          _phonenoController.text,
                          _zipCodeController.text,
                          _passwordController.text,
                          _confirmPasswordController.text,
                          groupValue);
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
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.25,
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
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
                      Navigator.of(context).pushNamed(signInScreen);
                    },
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0XFFD5A353)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUpData(
      BuildContext context,
      String stName,
      String stLName,
      String stEmail,
      String stPhone,
      String stZipCode,
      String stPassword,
      String stCPassword,
      String userType) async {
    Map data = {
      'first_name': stName,
      'last_name': stLName,
      'email': stEmail,
      'phone': stPhone,
      'zipcode': stZipCode,
      'password': stPassword,
      'confirm_password': stCPassword,
      'user_type': userType,
    };

    var response =
        await http.post(Uri.parse(BaseApi.registerUserApi), body: data);
    var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
    var resMsg = jsonResponse['message'];

    if (response.statusCode == 200) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('userData', response.body);
      final authToken = jsonResponse['data']['auth_token'].toString();
      print("authToken ---> $authToken");
      localStorageService.saveToDisk(LocalStorageService.USER_NAME,
          jsonResponse['data']['name'].toString().trim());
      localStorageService.saveToDisk(LocalStorageService.USER_EMAIL,
          jsonResponse['data']['email'].toString().trim());
      localStorageService.saveToDisk(LocalStorageService.USER_PHONE,
          jsonResponse['data']['phone'].toString().trim());
      print(jsonResponse.toString());
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
    } else {
      print(response.statusCode.toString());
      showToastMessage(resMsg.toString());
    }
  }
}
