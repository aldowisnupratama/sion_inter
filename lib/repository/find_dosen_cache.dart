import 'package:sion_inter/model/model.dart';

class FindDosenCache {
  final _cache = <String, FindDosenModel>{};

  FindDosenModel? get(String term) => _cache[term];
  void set(String term, FindDosenModel findDosenModel) =>
      _cache[term] = findDosenModel;
  bool contains(String term) => _cache.containsKey(term);
  void remove(String term) => _cache.remove(term);
}
