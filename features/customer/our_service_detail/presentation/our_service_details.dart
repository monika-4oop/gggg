import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groomely/api/api_provider/api_calling_provider.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/constants/colors.dart';
import 'package:groomely/src/features/customer/our_service_detail/model/our_service_model.dart';
import 'package:groomely/src/features/customer/app_home/presentation/home_view/service_details_section/service_details.dart';

class OurServiceScreenDetails extends StatefulWidget {
  final String serviceType;
  final String serviceName;
  const OurServiceScreenDetails(
      {super.key, required this.serviceType, required this.serviceName});

  @override
  State<OurServiceScreenDetails> createState() =>
      _OurServiceScreenDetailsState();
}

class _OurServiceScreenDetailsState extends State<OurServiceScreenDetails> {
  @override
  void initState() {
    // TODO: implement initState
    initalMethod();
    // setState(() {
    //   isLoading = false;
    // });
    super.initState();
  }

  bool isLoading = true;
  OurServiceModel ourServiceModel = OurServiceModel();
  initalMethod() async {
    ApiCallingClass apiCallingClass = ApiCallingClass();
    ourServiceModel = await apiCallingClass.fetchOurServiceDetails(
        serviceType: widget.serviceType);
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isLoading = false;
      });
    });
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(widget.serviceName.toString()),
          leadingWidth: 40,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset('assets/icons/back_round.png')),
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: ourServiceModel.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
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
                                  // ignore: unnecessary_null_comparison
                                  image: NetworkImage(
                                      '${BaseApi.imageUrl}${ourServiceModel.data?[index].service?.images?.first.sliderImage}'),
                                  fit: BoxFit.cover,
                                ),
                                // color: Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${ourServiceModel.data?[index].service?.additionalService?.name}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 4, top: 2, bottom: 2),
                                      child: Icon(
                                        CupertinoIcons.star_fill,
                                        color: colorLightGoldenYellow,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text(
                                      '4.84 (209.2K) ',
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Loup City, Nebraska 68853, USA",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        "\$${ourServiceModel.data?[index].rate}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
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
                                            color: colorGoldenYellow
                                                .withOpacity(0.6),
                                            size: 17.0,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                              "${ourServiceModel.data?[index].service?.duration}",
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceDetailsView(
                                                  serviceId: ourServiceModel
                                                      .data![index].service!.id
                                                      .toString(),
                                                  serviceName: ourServiceModel
                                                      .data![index]
                                                      .service!
                                                      .additionalService!
                                                      .name)));
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
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(color: Colors.red)),
                                ),
                                onPressed: () async {},
                                icon: const Icon(Icons.add),
                                label: const Text("Add"))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
