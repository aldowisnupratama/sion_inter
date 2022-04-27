part of 'biodata_dikti_cubit.dart';

abstract class BiodataDiktiState extends Equatable {
  const BiodataDiktiState();

  @override
  List<Object> get props => [];
}

class BiodataDiktiLoad extends BiodataDiktiState {}

class BiodataDiktiFail extends BiodataDiktiState {
  final String errorMessage;

  BiodataDiktiFail({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class BiodataDiktiSuccess extends BiodataDiktiState {
  final BiodataDikti biodataDikti;

  BiodataDiktiSuccess({required this.biodataDikti});

  @override
  List<Object> get props => [biodataDikti];
}
