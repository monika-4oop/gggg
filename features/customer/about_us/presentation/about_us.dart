import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/src/features/customer/about_us/bloc/about_us_bloc.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    BlocProvider.of<AboutUsBloc>(context).add(FetchAboutUsDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
        leadingWidth: 40,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/icons/back_round.png')),
      ),
      body: BlocBuilder<AboutUsBloc, AboutUsState>(
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AboutUsErrorState) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is AboutUsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Image.network(
                          '${BaseApi.imageUrl}${state.aboutUsModel.data!.bannerImg}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text("ABOUT US",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.0,
                              color: Color(0xFFD5A353)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${state.aboutUsModel.data!.section1Name}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${state.aboutUsModel.data!.section1Title}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image.network(
                            '${BaseApi.imageUrl}${state.aboutUsModel.data!.section1Img}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "${state.aboutUsModel.data!.section1Description}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${state.aboutUsModel.data!.section2Title}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.0,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image.network(
                            '${BaseApi.imageUrl}${state.aboutUsModel.data!.section2Img}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "${state.aboutUsModel.data!.section3Description}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
