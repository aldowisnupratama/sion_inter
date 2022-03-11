part of 'search_dosen_bloc.dart';

abstract class SearchDosenEvent extends Equatable {
  const SearchDosenEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SearchDosenEvent {
  final String term;

  TextChanged({required this.term});

  @override
  String toString() {
    return "TextChanged { text : ${term}}";
  }

  @override
  List<Object> get props => [term];
}
