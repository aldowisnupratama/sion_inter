part of 'resetmsteams_cubit.dart';

abstract class ResetmsteamsState extends Equatable {
  const ResetmsteamsState();

  @override
  List<Object> get props => [];
}

class ResetmsteamsInitial extends ResetmsteamsState {}

class ResetMsTeamsLoad extends ResetmsteamsState {}

class ResetMsTeamsSuccess extends ResetmsteamsState {
  final ResetMSTeamsModel resetMSTeamsModel;

  ResetMsTeamsSuccess({required this.resetMSTeamsModel});

  @override
  String toString() {
    return "ResetMsTeamsSuccess :{Succesfully reset ms password}";
  }
}

class ResetMsTeamsFail extends ResetmsteamsState {
  final ResetMSTeamsFailModel resetMsTeamsFail;

  ResetMsTeamsFail({required this.resetMsTeamsFail});
  @override
  String toString() {
    // TODO: implement toString
    return "ResetMsTeamsFail :{Fail to reset ms password}";
  }
}
