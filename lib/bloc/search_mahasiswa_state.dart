part of 'search_mahasiswa_bloc.dart';

abstract class SearchMahasiswaState extends Equatable {
  const SearchMahasiswaState();

  @override
  List<Object> get props => [];
}

class SearchMahasiswaEmpty extends SearchMahasiswaState {}

class SearchMahasiswaLoad extends SearchMahasiswaState {}

class SearchMahasiswaFail extends SearchMahasiswaState {
  final String error;

  SearchMahasiswaFail({required this.error});
}

class SearchMahasiswaSuccess extends SearchMahasiswaState {
  final List<Mahasiswa> listOfMahasiswa;

  SearchMahasiswaSuccess({required this.listOfMahasiswa});

  @override
  List<Object> get props => [listOfMahasiswa];

  @override
  String toString() {
    return "SearchMahasiswaSuccess { mahasiswa : ${listOfMahasiswa.length}";
  }
}
