import 'package:sion_inter/model/model.dart';

import '../services/services.dart';
import 'repositories.dart';

class SearchFinalProjectRepository {
  final FinalProjectService finalProjectService;
  final SearchFinalProjectCache finalProjectCache;

  SearchFinalProjectRepository(
      {required this.finalProjectService, required this.finalProjectCache});

  Future<SearchFinalProjectModel> search(String term) async {
    final cacheResult = finalProjectCache.get(term);
    if (cacheResult != null) {
      return cacheResult;
    }
    final result = await finalProjectService.searchFinalProjects(term);
    finalProjectCache.set(term, result);
    return result;
  }
}
