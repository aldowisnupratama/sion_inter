import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/services/final_project_service.dart';

part 'final_project_topic_state.dart';

class FinalProjectTopicCubit extends Cubit<FinalProjectTopicState> {
  FinalProjectTopicCubit() : super(FinalProjectTopicInitial());

  void fetchFinalProjectTopics() async {
    emit(FinalProjectTopicLoad());

    try {
      var response = await FinalProjectService().fetchFinalProjects();
      if (response.message == "ok") {
        emit(FinalProjectTopicSuccess(finalProjectTopic: response.topic));
      } else {
        emit(FinalProjectTopicFail(errorMessage: response.message));
      }
    } catch (e) {
      emit(FinalProjectTopicFail(errorMessage: e.toString()));
    }
  }
}
