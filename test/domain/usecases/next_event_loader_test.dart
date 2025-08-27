import 'dart:math';

import 'package:advanced_flutter/domain/entities/entities.dart';
import 'package:advanced_flutter/domain/repositories/repositories.dart';
import 'package:advanced_flutter/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';

class SpyLoadNextEventRepository implements LoadNextEventRepository {
  String? groupId;
  int callCount = 0;
  NextEventEntity? output;

  @override
  Future<NextEventEntity> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
    callCount++;

    return output!;
  }
}

void main() {
  late SpyLoadNextEventRepository repository;
  late NextEventLoaderUseCase sut;

  late String groupId;

  setUp(() {
    repository = SpyLoadNextEventRepository();
    repository.output = NextEventEntity(
      groupName: 'any_group',
      date: DateTime.now(),
      players: [
        NextEventPlayerEntity(
          id: 'any_id_1',
          name: 'any_name_1',
          photo: 'any_photo_1',
          isConfirmed: true,
          confirmationDate: DateTime.now(),
        ),
        NextEventPlayerEntity(id: 'any_id_2', name: 'any_name_2', position: 'any_position_2', isConfirmed: false),
      ],
    );
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

  test('should return event data on success', () async {
    // Act
    final NextEventEntity event = await sut(groupId: groupId);

    // Assert
    expect(event.groupName, repository.output?.groupName);
    expect(event.date, repository.output?.date);
    expect(event.players.length, 2);
    expect(event.players[0].id, repository.output?.players[0].id);
    expect(event.players[0].name, repository.output?.players[0].name);
    expect(event.players[0].initials, isNotEmpty);
    expect(event.players[0].photo, repository.output?.players[0].photo);
    expect(event.players[0].isConfirmed, repository.output?.players[0].isConfirmed);
    expect(event.players[0].confirmationDate, repository.output?.players[0].confirmationDate);
    expect(event.players[1].id, repository.output?.players[1].id);
    expect(event.players[1].name, repository.output?.players[1].name);
    expect(event.players[1].initials, isNotEmpty);
    expect(event.players[1].position, repository.output?.players[1].position);
    expect(event.players[1].isConfirmed, repository.output?.players[1].isConfirmed);
  });
}
