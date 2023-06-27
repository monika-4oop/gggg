part of 'appointments_bloc.dart';

abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentListLoadingState extends AppointmentsState {
  AppointmentListLoadingState();
}

class AppointmentListErrorState extends AppointmentsState {
  String? errorMessage;
  AppointmentListErrorState({this.errorMessage});
}

// ignore: must_be_immutable
class AppointmentListLoadedState extends AppointmentsState {
  List<Data> bookedAppointmentsList;
  AppointmentListLoadedState({required this.bookedAppointmentsList});
}
