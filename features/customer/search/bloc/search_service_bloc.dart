import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely/api/api_provider/api_calling_provider.dart';
import 'package:groomely/src/features/customer/search/model/all_service_model.dart';
part 'search_service_event.dart';
part 'search_service_state.dart';

class SearchServiceBloc extends Bloc<SearchServiceEvent, SearchServiceState> {
  SearchServiceBloc() : super(SearchServiceInitial()) {
    ApiCallingClass apiCallingClass = ApiCallingClass();
    AllServiceModel allServiceModel = AllServiceModel();

    on<FetchAllServiceEvent>((event, emit) async {
      emit(FetchAllServiceLoadintState());
      await apiCallingClass.fetchAllService().then((value) {
        if (value.status == true && value.data != null) {
          emit(FetchAllServiceLoadedState(allServiceModel: value));
        } else {
          emit(FetchAllServiceErrorState(
              errorMessage: value.message.toString()));
        }
      }).catchError((error) {
        emit(FetchAllServiceErrorState(errorMessage: error.toString()));
      });
    });

    on<ServiceSearchEvent>((event, emit) {
      emit(FetchAllServiceLoadintState());
      allServiceModel.data = allServiceModel.data!
          .where((element) => element.additionalService!.name
              .toString()
              .toLowerCase()
              .contains(event.searchKey))
          .toList();
      emit(FetchAllServiceLoadedState(allServiceModel: allServiceModel));
    });
  }
}
