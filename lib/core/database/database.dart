abstract class ADataBase<T> {
  Future<void> create(List<String> parameters);
  Future<void> save(Map<String, dynamic> parameters);
  Future<void> delete(Map<String, dynamic> where);
  Future<List<Map<String, dynamic>>> select(Map<String, dynamic> where);
}