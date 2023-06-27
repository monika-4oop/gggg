import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely/api/api_provider/api_calling_provider.dart';
import 'package:groomely/src/features/customer/about_us/model/about_us_model.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc() : super(AboutUsInitial()) {
    ApiCallingClass apiCallingClass = ApiCallingClass();
    on<FetchAboutUsDataEvent>((event, emit) async {
      try {
        emit(AboutUsLoading());
        final aboutUsModel = await apiCallingClass.getAboutUsData();
        if (aboutUsModel.status == true) {
          emit(AboutUsLoaded(aboutUsModel: aboutUsModel));
        } else {
          emit(AboutUsErrorState(errorMsg: aboutUsModel.message!));
        }
      } catch (e) {
        print(e.toString());
        emit(AboutUsErrorState());
      }
    });
  }
}
