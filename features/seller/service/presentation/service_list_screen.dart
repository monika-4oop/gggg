import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text("Service List",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(),
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardField(isFirst: true, rowChildren: const [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SERVICE NAME",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Artificial hair extensions")
                                ]),
                            Text("4.84(209.2k)")
                          ]),
                          cardField(rowChildren: const [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SERVICE NAME",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Men")
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SERVICE TYPE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("Styling")
                                ]),
                            Column(children: [
                              Text(
                                "DURATION",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("1 hr 5 mins")
                            ]),
                          ]),
                          cardField(rowChildren: [
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OFFER",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("20%")
                                ]),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RATE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("\$ 115")
                                ]),
                            CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                              thumbColor: CupertinoColors.white,
                              activeColor: CupertinoColors.activeGreen,
                            ),
                          ])
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget cardField({bool isFirst = false, required List<Widget> rowChildren}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: isFirst
          ? const BoxDecoration(
              color: Color(0xFFD5A353),
              borderRadius: BorderRadius.all(Radius.circular(10)))
          : null,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren),
    );
  }
}
