import 'package:flutter/material.dart';
import 'package:groomely/src/features/seller/dashboard/presentaion/presentation_screen.dart';
import 'package:groomely/src/features/seller/service/presentation/service_list_screen.dart';

class MainScreenWithBottomNavigationBar extends StatefulWidget {
  const MainScreenWithBottomNavigationBar({super.key});

  @override
  State<MainScreenWithBottomNavigationBar> createState() =>
      _MainScreenWithBottomNavigationBarState();
}

class _MainScreenWithBottomNavigationBarState
    extends State<MainScreenWithBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: const Text("SellerDashBoard"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SellerDashboardScreen()));
          },
        ),
        ListTile(
          title: const Text("manage Service"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ServiceListScreen()));
          },
        ),
      ],
    ));
  }
}
