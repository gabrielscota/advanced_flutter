import 'dart:math';

import 'package:advanced_flutter/domain/repositories/repositories.dart';
import 'package:advanced_flutter/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';

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
  late MockLoadNextEventRepository repository;
  late NextEventLoaderUseCase sut;

  late String groupId;

  setUp(() {
    repository = MockLoadNextEventRepository();
    sut = NextEventLoaderUseCase(repository: repository);

    groupId = Random().nextInt(50000).toString();
  });

  test('should load event data from a repository', () async {
    // Act
    await sut(groupId: groupId);

    // Assert
    expect(repository.groupId, groupId);
    expect(repository.callCount, 1);
  });
}
