part of 'biodata_cubit.dart';

abstract class BiodataState extends Equatable {
  const BiodataState();

  @override
  List<Object> get props => [];
}

class BiodataInitial extends BiodataState {}

class BiodataLoading extends BiodataState {}

class BiodataValid extends BiodataState {
  final BiodataModel biodataModel;

  BiodataValid({required this.biodataModel});
}

class BiodataInvalid extends BiodataState {
  final String errorMessage;

  BiodataInvalid({required this.errorMessage});
}
