import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely/api/api_provider/api_calling_provider.dart';
import 'package:groomely/src/features/customer/appointment/model/appointment_list_model.dart';
part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  ApiCallingClass apiCallingClass = ApiCallingClass();
  AppointmentsBloc() : super(AppointmentsInitial()) {
    on<FetchBookedAppointmentsEvent>(fetchBookedAppointments);
  }

  void fetchBookedAppointments(FetchBookedAppointmentsEvent event,
      Emitter<AppointmentsState> emit) async {
    emit(AppointmentListLoadingState());
    try {
      emit(AppointmentListLoadingState());
      AppointmentsListModel appointmentsListModel =
          await apiCallingClass.getAppointmentListApi();
      if (appointmentsListModel.status == true) {
        emit(AppointmentListLoadedState(
            bookedAppointmentsList: appointmentsListModel.data!));
      }
    } catch (e) {
      print(e.toString());
      emit(AppointmentListErrorState());
    }
  }
}
