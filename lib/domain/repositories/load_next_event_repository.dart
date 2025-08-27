abstract interface class LoadNextEventRepository {
  Future<void> loadNextEvent({required String groupId});
}
