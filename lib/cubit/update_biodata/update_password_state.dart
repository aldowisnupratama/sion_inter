part of 'update_password_cubit.dart';

abstract class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoad extends UpdatePasswordState {}

class UpdatePasswordValid extends UpdatePasswordState {
  final UpdatePasswordModel updatePasswordModel;

  UpdatePasswordValid(this.updatePasswordModel);
}

class UpdatePasswordInvalid extends UpdatePasswordState {
  final String errorMessage;

  UpdatePasswordInvalid(this.errorMessage);
}
