import 'package:sion_inter/model/model.dart';

class FindMahasiswaCache {
  final _cache = <String, FindMahasiswaModel>{};
  FindMahasiswaModel? get(String term) => _cache[term];
  void set(String term, FindMahasiswaModel findMahasiswaModel) =>
      _cache[term] = findMahasiswaModel;

  bool contains(String term) => _cache.containsKey(term);
  void remove(String term) => _cache.remove(term);
}
