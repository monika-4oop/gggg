import 'package:flutter/material.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.black,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/image-vector/barber-shop-logo-260nw-670497745.jpg'),
                    ),
                    Text(
                      'Seller Name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("4.84 (209.2k)",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    Text("Loup City, Nebraska 68853,USA",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ],
                ),
              ),
              serviceCard(serviceName: 'My Active Services'),
              serviceCard(serviceName: "Today's Booking"),
            ],
          ),
        ));
  }

  Widget serviceCard({required String serviceName, String? serviceData}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              serviceName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Text(
              'More >',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 210,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    height: 230,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFD5A353)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("HAIRCUT + BEARD + MASSAGE"),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.yellow),
                            SizedBox(width: 6),
                            Text("4.84 (209.2k)",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.watch_later_outlined,
                                size: 18, color: Colors.yellow),
                            SizedBox(width: 6),
                            Text("1 hr 5 mins",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Text("\$ 10.00",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 10, top: 5, bottom: 5),
                          height: 1,
                          color: Colors.black,
                        ),
                        checkBoxText(text: "men 's Haircut"),
                        checkBoxText(text: "Beard shape & Style"),
                        checkBoxText(text: "10 min Head Massage"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget checkBoxText({required String text}) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          size: 10,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
