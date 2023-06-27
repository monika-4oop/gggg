import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Help & Support"),
        leadingWidth: 40,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/icons/back_round.png')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 2,
                //     offset: Offset(0, 2),
                //   )
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Need help with recent payments/\norders?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.0),
                  ),
                  const Text("you don't have any recent payments",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            elevation: 0,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.7, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                                side: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 0.5))),
                        onPressed: () {},
                        child: const Text(
                          "View Older Payments",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD5A353)),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // height: MediaQuery.of(context).size.height * 0.2,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 2,
                  //     offset: Offset(0, 2),
                  //   )
                  // ],
                ),
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Browse Help Topic",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 2,
                //     offset: Offset(0, 2),
                //   )
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Popular Help Topics",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.0),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Account Safety Tips",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    subtitle: const Text(
                      "Guidelines to safeguard your account and money",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: SvgPicture.asset(
                        "assets/icons/check_logo.svg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  const Text(
                    "Know more..",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD5A353)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 2,
                //     offset: Offset(0, 2),
                //   )
                // ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "What issue are you facing?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "I want to track my order",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "Lorem ipsum dolor sit amet consectetur. Urna suspendisse bibendum scelerisque enim cursus varius egestas pharetra in.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 1,
                          color: Colors.black,
                        );
                      },
                      itemCount: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
