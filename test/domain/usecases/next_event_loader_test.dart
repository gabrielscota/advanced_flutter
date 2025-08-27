import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

class NextEventLoaderUseCase {
  final LoadNextEventRepository repository;

  NextEventLoaderUseCase({required this.repository});

  Future<void> call({required String groupId}) async {
    await repository.loadNextEvent(groupId: groupId);
  }
}

abstract interface class LoadNextEventRepository {
  Future<void> loadNextEvent({required String groupId});
}

class MockLoadNextEventRepository implements LoadNextEventRepository {
  String? groupId;
  int callCount = 0;

  @override
  Future<void> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
    callCount++;
  }
}

void main() {
  test('should load event data from a repository', () async {
    // Arrange
    final String groupId = Random().nextInt(50000).toString();
    final MockLoadNextEventRepository repository = MockLoadNextEventRepository();
    final NextEventLoaderUseCase sut = NextEventLoaderUseCase(repository: repository);

    // Act
    await sut(groupId: groupId);

    // Assert
    expect(repository.groupId, groupId);
    expect(repository.callCount, 1);
  });
}
