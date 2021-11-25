part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginValid extends LoginState {}

class LoginInvalid extends LoginState {
  final String errorMessage;

  LoginInvalid({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
