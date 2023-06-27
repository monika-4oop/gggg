import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely/src/common_widgets/service_card.dart';
import 'package:groomely/constants/api_config.dart';
import 'package:groomely/src/features/customer/search/bloc/search_service_bloc.dart';

class HomePageSearchScreen extends StatefulWidget {
  const HomePageSearchScreen({super.key});

  @override
  State<HomePageSearchScreen> createState() => _HomePageSearchScreenState();
}

class _HomePageSearchScreenState extends State<HomePageSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<SearchServiceBloc>(context).add(FetchAllServiceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/icons/back_round.png')),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          child: TextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            // style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.search,
                // color: Colors.black,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  _searchController.clear();
                  BlocProvider.of<SearchServiceBloc>(context)
                      .add(FetchAllServiceEvent());
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              hintText: '  Search for services',
              // hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                BlocProvider.of<SearchServiceBloc>(context)
                    .add(FetchAllServiceEvent());
              } else {
                BlocProvider.of<SearchServiceBloc>(context)
                    .add(ServiceSearchEvent(searchKey: value));
              }
            },
          ),
        ),
      ),
      body: BlocBuilder<SearchServiceBloc, SearchServiceState>(
        builder: (context, state) {
          if (state is FetchAllServiceLoadintState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchAllServiceLoadedState) {
            return ListView.builder(
              itemCount: state.allServiceModel.data!.length,
              itemBuilder: (context, index) {
                return ServiceCardScreen(
                  serviceId: state.allServiceModel.data![index].id.toString(),
                  rating: state.allServiceModel.data![index].review!.length
                      .toString(),
                  serviceDuration:
                      state.allServiceModel.data![index].duration.toString(),
                  serviceImage:
                      '${BaseApi.imageUrl}${state.allServiceModel.data![index].images!.first.sliderImage}',
                  serviceName: state
                      .allServiceModel.data![index].additionalService!.name
                      .toString(),
                  description:
                      state.allServiceModel.data![index].description.toString(),
                );
              },
            );
          } else if (state is FetchAllServiceErrorState) {
            return const Center(
              child: Text('Error occured while fetching services'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
