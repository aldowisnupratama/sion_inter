part of 'search_final_project_bloc.dart';

abstract class SearchFinalProjectState extends Equatable {
  const SearchFinalProjectState();

  @override
  List<Object> get props => [];
}

class SearchFinalProjectEmpty extends SearchFinalProjectState {}

class SearchFinalProjectLoad extends SearchFinalProjectState {}

class SearchFinalProjectFail extends SearchFinalProjectState {
  final String errorMessage;

  SearchFinalProjectFail(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class SearchFinalProjectSuccess extends SearchFinalProjectState {
  final List<Judul> listofFinalProject;

  SearchFinalProjectSuccess({required this.listofFinalProject});
  @override
  // TODO: implement props
  List<Object> get props => [listofFinalProject];

  @override
  String toString() {
    // TODO: implement toString
    return "SearchFinalProjectSuccess {fp_topics: ${listofFinalProject.length}";
  }
}
