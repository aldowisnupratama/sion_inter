part of 'search_final_project_bloc.dart';

abstract class SearchFinalProjectEvent extends Equatable {
  const SearchFinalProjectEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SearchFinalProjectEvent {
  final String term;

  TextChanged({required this.term});

  @override
  String toString() {
    return "TextChanged { text : ${term}}";
  }

  @override
  List<Object> get props => [term];
}
