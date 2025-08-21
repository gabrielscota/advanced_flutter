import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
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
  });

  String getInitials() {
    final List<String> nameParts = name.split(' ');

    return '${nameParts.first[0]}${nameParts.last[0]}';
  }
}

void main() {
  NextEventPlayer makeSut(String name) => NextEventPlayer(id: '1', name: name, isConfirmed: true);

  test('should return the first letter of the first and last names', () {
    // Arrange & Act & Assert (AAA)
    expect(makeSut('John Doe').getInitials(), 'JD');
    expect(makeSut('Jane Smith').getInitials(), 'JS');
    expect(makeSut('Jim Brown Anderson').getInitials(), 'JA');
  });
}
