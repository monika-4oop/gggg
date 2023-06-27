part of 'about_us_bloc.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUsModel aboutUsModel;

  AboutUsLoaded({required this.aboutUsModel});
}

class AboutUsErrorState extends AboutUsState {
  String errorMsg;
  AboutUsErrorState({this.errorMsg = "Something went wrong"});
}
