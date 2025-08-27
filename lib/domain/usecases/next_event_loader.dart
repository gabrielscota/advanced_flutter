import 'package:advanced_flutter/domain/entities/entities.dart';

import '../repositories/repositories.dart';

class NextEventLoaderUseCase {
  final LoadNextEventRepository repository;

  NextEventLoaderUseCase({required this.repository});

  Future<NextEventEntity> call({required String groupId}) async {
    return repository.loadNextEvent(groupId: groupId);
  }
}
