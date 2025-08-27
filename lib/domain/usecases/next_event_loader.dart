import '../repositories/repositories.dart';

class NextEventLoaderUseCase {
  final LoadNextEventRepository repository;

  NextEventLoaderUseCase({required this.repository});

  Future<void> call({required String groupId}) async {
    await repository.loadNextEvent(groupId: groupId);
  }
}
