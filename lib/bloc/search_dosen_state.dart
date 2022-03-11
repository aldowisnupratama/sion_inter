part of 'search_dosen_bloc.dart';

abstract class SearchDosenState extends Equatable {
  const SearchDosenState();

  @override
  List<Object> get props => [];
}

class SearchDosenEmpty extends SearchDosenState {}

class SearchDosenLoad extends SearchDosenState {}

class SearchDosenFail extends SearchDosenState {
  final String error;

  SearchDosenFail({required this.error});
  @override
  List<Object> get props => [error];
}

class SearchDosenSuccess extends SearchDosenState {
  final List<Dosen> listOfDosen;
  SearchDosenSuccess({required this.listOfDosen});

  @override
  List<Object> get props => [listOfDosen];

  @override
  String toString() {
    return "SearchDosenSuccess {dosen : ${listOfDosen.length}}";
  }
}
