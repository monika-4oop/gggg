import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/constants/colors.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool textIsObscure = true;
  bool textIsObscure2 = true;
  bool textIsObscure3 = true;
  var authToken;
  var _userData;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      getUserdata();
    });
  }

  getUserdata() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          String? stringValue = prefs.getString('userData');
          _userData = jsonDecode(stringValue!)["data"];
          authToken = _userData['auth_token'];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          "Chnage Password",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 16.0,
                color: colorPrimaryBlack,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Material(
        color: Colors.grey[100],
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _oldPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your old password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: textIsObscure,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 13.0,
                          bottom: 13.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAAAAAA),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        hintText: 'Current Password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Color(0xffAAAAAA),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() => textIsObscure = !textIsObscure);
                          },
                          icon: textIsObscure == true
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Color(0xffAAAAAA),
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: Color(0xffAAAAAA),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    TextFormField(
                      controller: _newPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your new password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: textIsObscure2,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 13.0,
                          bottom: 13.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAAAAAA),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGoldenYellow,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        hintText: 'New Password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Color(0xffAAAAAA),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() => textIsObscure2 = !textIsObscure2);
                          },
                          icon: textIsObscure2 == true
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Color(0xffAAAAAA),
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: Color(0xffAAAAAA),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 23.0,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Confirm your password';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm your password';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Password must be same as above';
                        }
                        return null;
                      },

                      obscureText: textIsObscure3,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 13.0,
                          bottom: 13.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAAAAAA),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGoldenYellow,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Color(0xffAAAAAA),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() => textIsObscure3 = !textIsObscure3);
                          },
                          icon: textIsObscure3 == true
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Color(0xffAAAAAA),
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: Color(0xffAAAAAA),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
        child: ElevatedButton(
          onPressed: () {
            final isValidForm = _formKey.currentState!.validate();
            if (isValidForm) {
              changePasswordData(
                  context,
                  _oldPasswordController.text,
                  _newPasswordController.text,
                  _confirmPasswordController.text,
                  authToken);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: colorGoldenYellow,
            foregroundColor: const Color(0xff000000),
            minimumSize: const Size(double.infinity, 55.0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: const Text(
            'SAVE',
          ),
        ),
      ),
    );
  }

  void changePasswordData(BuildContext context, String stOldPass,
      String stNewPass, String stConfirmPass, authToken) async {
    try {
      Map data = {
        'old_password': stOldPass.toString(),
        'new_password': stNewPass.toString(),
        'comfirm_password': stConfirmPass.toString(),
      };
      var response = await http
          .post(Uri.parse(BaseApi.userChangePassword), body: data, headers: {
        'Authorization': 'Bearer ${authToken.toString()}',
      });
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      //var resMsg = jsonResponse['message'];
      if (response.statusCode == 200) {
        setState(() {
          // showToastMessage(resMsg);
          // Navigator.of(context).pop();
        });
      } else {
        //showToastMessage(resMsg);
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }
}
