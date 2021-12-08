part of 'final_test_cubit.dart';

abstract class FinalTestState extends Equatable {
  const FinalTestState();

  @override
  List<Object> get props => [];
}

class FinalTestInitial extends FinalTestState {}

class FinalTestLoading extends FinalTestState {}

class FinalTestSuccess extends FinalTestState {
  final List<Uas>? listOfUas;
  FinalTestSuccess({required this.listOfUas});
  @override
  List<Object> get props => [listOfUas!];
}

class FinalTestFailed extends FinalTestState {
  final String errorMessage;

  FinalTestFailed({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
