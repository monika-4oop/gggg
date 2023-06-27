import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groomely/src/features/customer/appointment/bloc/appointments_bloc.dart';
import 'package:groomely/src/features/customer/appointment/model/appointment_list_model.dart';

class AppointmentsList extends StatefulWidget {
  AppointmentsList({
    this.sideBar = true,
    Key? key,
  }) : super(key: key);

  bool sideBar;
  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppointmentsBloc>(context)
        .add(FetchBookedAppointmentsEvent());
  }

  bool viewVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppointmentsBloc, AppointmentsState>(
        builder: (context, state) {
          print(state);
          if (state is AppointmentListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AppointmentListErrorState) {
            return const Center(child: Text("Something went wrong."));
          }
          if (state is AppointmentListLoadedState) {
            print(state.bookedAppointmentsList.length);
            return ListView.builder(
              // (1

              itemCount: state.bookedAppointmentsList.length,
              itemBuilder: (context, index) {
                return appointmentDetailsCard(
                    state.bookedAppointmentsList[index]);
              },
            );
          }
          return const Center(child: Text("No appointment Booked."));
        },
      ),
    );
  }

  Widget cardRow({required String titleKey, required String titleValue}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: titleKey,
                style: const TextStyle(
                  color: Color(0xff6c757d),
                  fontSize: 15.0,
                )),
            TextSpan(
                text: titleValue,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget appointmentDetailsCard(Data appointmentList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 0.5,
        child: Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/_Group_.svg",
                      height: 70,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "${appointmentList.seller!.shopName}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const Text("4.84 (209.2k)",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300)),
                        const Text("Package",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300)),
                        const Text("HAIRCUT + BEARD + MASSAGE",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
                // const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.alarm_add_sharp,
                              size: 21, color: Color(0xFFD5A353)),
                          const SizedBox(width: 6),
                          RichText(
                              text: TextSpan(
                                  text: "Appointment Time",
                                  style: const TextStyle(
                                      color: Color(0xFF080706),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                  children: [
                                TextSpan(
                                  text:
                                      "\n${appointmentList.bookingTime!.time.toString()}",
                                  style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ]))
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 30,
                        color: Colors.black,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFFD5A353)),
                        child: Row(
                          children: [
                            const Icon(Icons.alarm_add_sharp,
                                size: 11, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(appointmentList.service!.duration.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Row(children: [
                              Icon(Icons.gps_fixed,
                                  size: 21, color: Color(0xFFD5A353)),
                              SizedBox(width: 10),
                              Text(
                                "Sellers Address",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )
                            ]),
                            Text(
                              "  ${appointmentList.seller!.shopAddress.toString()}\n  ${appointmentList.seller!.zipcode}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ]),
                      Text(
                        '\$${appointmentList.amount!}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  // height: 0.1,
                  thickness: 0.5,
                ),
                customRow("Men's Haircut"),
                customRow("Beard Shape & Style"),
                customRow("10 min Head Massage"),
              ],
            )),
      ),
    );
  }

  Widget customRow(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/check_icon.svg",
            width: 8,
            height: 8,
            color: Colors.black,
          ),
          const SizedBox(width: 7),
          Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
