part of 'final_project_topic_cubit.dart';

abstract class FinalProjectTopicState extends Equatable {
  const FinalProjectTopicState();

  @override
  List<Object> get props => [];
}

class FinalProjectTopicInitial extends FinalProjectTopicState {}

class FinalProjectTopicLoad extends FinalProjectTopicState {}

class FinalProjectTopicFail extends FinalProjectTopicState {
  final String errorMessage;

  FinalProjectTopicFail({required this.errorMessage});
}

class FinalProjectTopicSuccess extends FinalProjectTopicState {
  final List<FinalProjectTopic> finalProjectTopic;

  FinalProjectTopicSuccess({required this.finalProjectTopic});
}
