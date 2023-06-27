part of 'search_service_bloc.dart';

abstract class SearchServiceState {}

class SearchServiceInitial extends SearchServiceState {}

class FetchAllServiceLoadintState extends SearchServiceState {}

class FetchAllServiceLoadedState extends SearchServiceState {
  AllServiceModel allServiceModel;

  FetchAllServiceLoadedState({required this.allServiceModel});
}

class FetchAllServiceErrorState extends SearchServiceState {
  String errorMessage;
  FetchAllServiceErrorState({required this.errorMessage});
}
