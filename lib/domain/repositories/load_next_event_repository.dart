import '../entities/entities.dart';

abstract interface class LoadNextEventRepository {
  Future<NextEventEntity> loadNextEvent({required String groupId});
}
