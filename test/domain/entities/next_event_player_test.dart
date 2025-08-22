import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  late final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayer({
    required this.id,
    required this.name,
    this.photo,
    this.position,
    required this.isConfirmed,
    this.confirmationDate,
  }) {
    initials = _getInitials();
  }

  String _getInitials() {
    final List<String> nameParts = name.split(' ');

    return '${nameParts.first[0]}${nameParts.last[0]}';
  }
}

void main() {
  String initialsOf(String name) => NextEventPlayer(id: '1', name: name, isConfirmed: true).initials;

  test('should return the first letter of the first and last names', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf('John Doe'), 'JD');
    expect(initialsOf('Jane Smith'), 'JS');
    expect(initialsOf('Jim Brown Anderson'), 'JA');
  });
}
