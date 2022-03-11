import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/repository/find_mahasiswa_repository.dart';
import 'package:stream_transform/stream_transform.dart';
part 'search_mahasiswa_event.dart';
part 'search_mahasiswa_state.dart';

const _duration = const Duration(milliseconds: 300);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchMahasiswaBloc
    extends Bloc<SearchMahasiswaEvent, SearchMahasiswaState> {
  final FindMahasiswaRepostory findMahasiswaRepostory;

  SearchMahasiswaBloc({required this.findMahasiswaRepostory})
      : super(SearchMahasiswaEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  void _onTextChanged(
      TextChanged event, Emitter<SearchMahasiswaState> emit) async {
    final searchTerm = event.text;
    if (searchTerm.isEmpty) return emit(SearchMahasiswaEmpty());
    emit(SearchMahasiswaLoad());

    try {
      final results = await findMahasiswaRepostory.search(searchTerm);
      emit(SearchMahasiswaSuccess(listOfMahasiswa: results.mahasiswa));
    } catch (error) {
      emit(error is FindMahasiswaError
          ? SearchMahasiswaFail(error: error.message)
          : SearchMahasiswaFail(error: "something went error"));
    }
  }
}
