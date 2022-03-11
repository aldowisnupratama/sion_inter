import 'package:sion_inter/model/find_dosen_model.dart';
import 'package:sion_inter/repository/find_dosen_cache.dart';
import 'package:sion_inter/services/services.dart';

class FindDosenRepository {
  final FindService findService;
  final FindDosenCache findDosenCache;

  FindDosenRepository(
      {required this.findService, required this.findDosenCache});

  Future<FindDosenModel> search(String term) async {
    final cacheResult = findDosenCache.get(term);
    if (cacheResult != null) {
      return cacheResult;
    }
    final result = await findService.searchForLecturer(term);
    findDosenCache.set(term, result);
    return result;
  }
}
