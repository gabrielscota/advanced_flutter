import 'entities.dart';

class NextEventEntity {
  final String groupName;
  final DateTime date;
  final List<NextEventPlayerEntity> players;

  NextEventEntity({required this.groupName, required this.date, required this.players});
}
