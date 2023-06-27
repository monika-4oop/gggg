import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/constants/colors.dart';
import 'package:groomely/src/utils/device_size_config.dart';
import 'package:groomely/src/utils/messgaetoast.dart';
import 'package:groomely/src/utils/storage/local_storage.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
// import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var authToken;
  var _userData;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LocalStorageService localStorageService = LocalStorageService();
  File? _image;
  @override
  void initState() {
    super.initState();
    setState(() {
      getUserData();
    });
  }

  Future<File?> getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        _image = imageFile;
        print('Image_Path $_image');
        localStorageService.saveToDisk(
            LocalStorageService.PROFILE_IMG, _image!.path);
      });
      return imageFile;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 16.0,
                color: colorPrimaryBlack,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.14,
                        child: (_image != null)
                            ? Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              )
                            : const Image(
                                image: AssetImage(
                                    'assets/images/people_usplash.jpg'),
                                fit: BoxFit.fill),

                        // Image.network(
                        //     "https://excellisit.net/storage/customer/7qHvQ9pvPxeEdoRbfkpVS4fjOUJLNp8UiAjXq3AD.jpg",
                        //     fit: BoxFit.fill,
                        //   ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.08,
                      right: -10,
                      child: IconButton(
                        icon: const CircleAvatar(
                          radius: 12,
                          child: Icon(
                            Icons.edit,
                            size: 12.0,
                          ),
                        ),
                        onPressed: () async {
                          await getImage().then((value) {
                            setState(() {
                              _image = value;
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                customTextField(controller: _nameController, title: "Name"),
                customTextField(controller: _emailController, title: "Email"),
                customTextField(controller: _phonenoController, title: "Phone"),
                customTextField(
                    controller: passwordController,
                    title: "Password",
                    obs: true),
              ],
            )),
            ElevatedButton(
              onPressed: () {
                updateProfile(
                  context,
                  _nameController.text,
                  _emailController.text,
                  _phonenoController.text,
                  authToken,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorGoldenYellow,
                foregroundColor: Colors.white,
                elevation: 0.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                minimumSize: Size(
                  double.infinity,
                  deviceSizeConfig.blockSizeVertical * 5,
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.25,
                ),
              ),
              child: const Text(
                'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }

  getUserData() async {
    authToken =
        await localStorageService.getFromDisk(LocalStorageService.AUTH_TOKEN) ??
            '';
    _nameController.text =
        await localStorageService.getFromDisk(LocalStorageService.USER_NAME) ??
            '';
    _emailController.text =
        await localStorageService.getFromDisk(LocalStorageService.USER_EMAIL) ??
            '';
    _phonenoController.text =
        await localStorageService.getFromDisk(LocalStorageService.USER_PHONE) ??
            '';

    setState(() {});
  }

  Future<void> updateProfile(BuildContext context, String stName,
      String stEmail, String stPhone, authToken) async {
    String fileName = basename(_image!.path);
    // print("filePath" + _image!.path.toString());
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Map data = {
        'name': stName.toString(),
        'email': stEmail.toString(),
        'phone': stPhone.toString(),
        'profile_picture': _image != null
            ? 'data:image/png;,${base64Encode(_image!.readAsBytesSync())}'
            : '',
      };
      var response = await http
          .post(Uri.parse(BaseApi.userUpdateProfile), body: data, headers: {
        'Authorization': 'Bearer ${authToken.toString()}',
      });
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      var resMsg = jsonResponse['message'];

      if (response.statusCode == 200) {
        showToastMessage(resMsg);
      } else {
        showToastMessage(resMsg);
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  Widget customTextField(
      {required TextEditingController controller,
      required String title,
      bool obs = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 1),
            child: TextField(
              obscureText: obs,
              cursorHeight: 15,
              controller: controller,
              focusNode: null,
              keyboardType: TextInputType.number,
              cursorRadius: const Radius.circular(0.8),
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.black),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
