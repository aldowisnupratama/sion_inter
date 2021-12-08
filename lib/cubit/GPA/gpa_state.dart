part of 'gpa_cubit.dart';

abstract class GpaState extends Equatable {
  const GpaState();

  @override
  List<Object> get props => [];
}

class GpaInitial extends GpaState {}

class GpaLoading extends GpaState {}

class GpaSuccess extends GpaState {
  final List<GPA> gpa;

  GpaSuccess({required this.gpa});

  @override
  List<Object> get props => gpa;
}

class GpaFailed extends GpaState {
  final String errorMessage;

  GpaFailed({required this.errorMessage});
}
