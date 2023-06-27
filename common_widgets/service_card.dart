import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groomely/constants/colors.dart';
import 'package:groomely/src/features/customer/app_home/presentation/home_view/service_details_section/service_details.dart';

class ServiceCardScreen extends StatelessWidget {
  final String serviceName;
  final String serviceImage;
  final String serviceDuration;
  final String description;
  final String rating;
  final String serviceId;

  const ServiceCardScreen(
      {super.key,
      required this.serviceName,
      required this.serviceImage,
      required this.serviceDuration,
      required this.description,
      required this.rating,
      required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(serviceImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 4, top: 2, bottom: 2),
                        child: Icon(
                          CupertinoIcons.star_fill,
                          color: colorLightGoldenYellow,
                          size: 20.0,
                        ),
                      ),
                      Text(
                        '$rating (209.2K) ',
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 10.0,
                    ),
                    color: colorLightGoldenYellow,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.clock,
                          color: colorGoldenYellow.withOpacity(0.6),
                          size: 17.0,
                        ),
                        const SizedBox(width: 5),
                        Text(serviceDuration,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300)),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            description,
            maxLines: 2,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceDetailsView(
                                serviceId: serviceId,
                                serviceName: serviceName)));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.red)),
                  ),
                  onPressed: () async {},
                  icon: const Icon(Icons.favorite_border_outlined),
                  label: const Text("Add to Wishlist"))
            ],
          )
        ],
      ),
    );
  }
}
