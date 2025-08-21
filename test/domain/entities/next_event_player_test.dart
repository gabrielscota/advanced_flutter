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
  test('should return the first letter of the first and last names', () {
    // Arrange
    final NextEventPlayer player = NextEventPlayer(id: '1', name: 'John Doe', isConfirmed: true);
    final NextEventPlayer player2 = NextEventPlayer(id: '2', name: 'Jane Smith', isConfirmed: false);
    final NextEventPlayer player3 = NextEventPlayer(id: '3', name: 'Jim Brown Anderson', isConfirmed: true);

    // Act & Assert
    expect(player.getInitials(), 'JD');
    expect(player2.getInitials(), 'JS');
    expect(player3.getInitials(), 'JA');
  });
}
