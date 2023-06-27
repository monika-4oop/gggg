part of 'search_service_bloc.dart';

abstract class SearchServiceEvent {}

class FetchAllServiceEvent extends SearchServiceEvent {}

class ServiceSearchEvent extends SearchServiceEvent {
  String searchKey;
  ServiceSearchEvent({required this.searchKey});
}
