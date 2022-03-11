part of 'search_mahasiswa_bloc.dart';

abstract class SearchMahasiswaEvent extends Equatable {
  const SearchMahasiswaEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SearchMahasiswaEvent {
  final String text;

  TextChanged({required this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() {
    return "TextChanged { text : ${text}";
  }
}
