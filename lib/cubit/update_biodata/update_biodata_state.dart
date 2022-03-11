part of 'update_biodata_cubit.dart';

abstract class UpdateBiodataState extends Equatable {
  const UpdateBiodataState();

  @override
  List<Object> get props => [];
}

class UpdateBiodataInitial extends UpdateBiodataState {}

class UpdateBiodataLoad extends UpdateBiodataState {}

class UpdateBiodataValid extends UpdateBiodataState {
  final UpdateBiodataModel updateBiodataModel;

  UpdateBiodataValid({required this.updateBiodataModel});
}

class UpdateBiodatalInvalid extends UpdateBiodataState {
  final String errorMessage;
  UpdateBiodatalInvalid({required this.errorMessage});
}
