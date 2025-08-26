import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayer._({
    required this.id,
    required this.name,
    required this.initials,
    this.photo,
    this.position,
    required this.isConfirmed,
    this.confirmationDate,
  });

  factory NextEventPlayer({
    required String id,
    required String name,
    String? photo,
    String? position,
    required bool isConfirmed,
    DateTime? confirmationDate,
  }) => NextEventPlayer._(
    id: id,
    name: name,
    initials: _getInitials(name),
    photo: photo,
    position: position,
    isConfirmed: isConfirmed,
    confirmationDate: confirmationDate,
  );

  static String _getInitials(String name) {
    final List<String> nameParts = name.toUpperCase().split(' ');
    final String firstChar = nameParts.first[0];
    final String lastChar = nameParts.last.split('').elementAtOrNull(nameParts.length == 1 ? 1 : 0) ?? '';

    return '$firstChar$lastChar';
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

  test('should return the first letters of the first name', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf('John'), 'JO');
    expect(initialsOf('J'), 'J');
  });

  test('should convert to uppercase', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf('john doe'), 'JD');
    expect(initialsOf('john'), 'JO');
    expect(initialsOf('j'), 'J');
  });
}
