import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/repository/repositories.dart';

import '../services/services.dart';

class FindMahasiswaRepostory {
  final FindMahasiswaCache findMahasiswaCache;
  final FindService findService;

  FindMahasiswaRepostory(
      {required this.findMahasiswaCache, required this.findService});

  Future<FindMahasiswaModel> search(String term) async {
    final cachedResult = findMahasiswaCache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await findService.searchForMhs(term);
    findMahasiswaCache.set(term, result);
    return result;
  }
}
