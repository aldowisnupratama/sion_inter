part of 'update_biodata_dikti_cubit.dart';

abstract class UpdateBiodataDiktiState extends Equatable {
  const UpdateBiodataDiktiState();

  @override
  List<Object> get props => [];
}

class UpdateBiodataDiktiInitial extends UpdateBiodataDiktiState {}

class UpdateBiodataDiktiLoad extends UpdateBiodataDiktiState {}

class UpdateBiodataDiktiFail extends UpdateBiodataDiktiState {
  final List<String> errorMessage;

  UpdateBiodataDiktiFail({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class UpdateBiodataDiktiSucces extends UpdateBiodataDiktiState {
  final UpdateBiodataDiktiSuccessModel updateBiodataDiktiSuccessModel;

  UpdateBiodataDiktiSucces({required this.updateBiodataDiktiSuccessModel});
  @override
  List<Object> get props => [updateBiodataDiktiSuccessModel];
}
