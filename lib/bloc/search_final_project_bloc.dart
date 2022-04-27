import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/repository/repositories.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_final_project_event.dart';
part 'search_final_project_state.dart';

const _duration = const Duration(milliseconds: 300);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchFinalProjectBloc
    extends Bloc<SearchFinalProjectEvent, SearchFinalProjectState> {
  final SearchFinalProjectRepository searchFinalProjectRepository;
  SearchFinalProjectBloc({required this.searchFinalProjectRepository})
      : super(SearchFinalProjectEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }
  void _onTextChanged(
      TextChanged event, Emitter<SearchFinalProjectState> emit) async {
    var searchTerm = event.term;
    if (searchTerm.isEmpty) return emit(SearchFinalProjectEmpty());
    emit(SearchFinalProjectLoad());
    try {
      final result = await searchFinalProjectRepository.search(searchTerm);
      emit(SearchFinalProjectSuccess(listofFinalProject: result.judul));
    } catch (error) {
      emit(error is FindDosenError
          ? SearchFinalProjectFail(error.message)
          : SearchFinalProjectFail("something went wrong"));
    }
  }
}
