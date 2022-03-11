import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/repository/repositories.dart';

import '../model/model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_dosen_event.dart';
part 'search_dosen_state.dart';

const _duration = const Duration(milliseconds: 300);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchDosenBloc extends Bloc<SearchDosenEvent, SearchDosenState> {
  final FindDosenRepository findDosenRepository;

  SearchDosenBloc({required this.findDosenRepository})
      : super(SearchDosenEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  void _onTextChanged(TextChanged event, Emitter<SearchDosenState> emit) async {
    var searchTerm = event.term;
    if (searchTerm.isEmpty) return emit(SearchDosenEmpty());
    emit(SearchDosenLoad());
    try {
      final result = await findDosenRepository.search(searchTerm);
      emit(SearchDosenSuccess(listOfDosen: result.dosen));
    } catch (error) {
      emit(error is FindDosenError
          ? SearchDosenFail(error: error.message)
          : SearchDosenFail(error: "something went wrong"));
    }
  }
}
