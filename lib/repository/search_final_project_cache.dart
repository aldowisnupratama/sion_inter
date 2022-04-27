import '../model/model.dart';

class SearchFinalProjectCache {
  final _cache = <String, SearchFinalProjectModel>{};

  SearchFinalProjectModel? get(String term) => _cache[term];
  void set(String term, SearchFinalProjectModel searchFinalProjectModel) =>
      _cache[term] = searchFinalProjectModel;
  bool contains(String term) => _cache.containsKey(term);
  void remove(String term) => _cache.remove(term);
}
