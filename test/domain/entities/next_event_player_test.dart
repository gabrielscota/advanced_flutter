import 'package:advanced_flutter/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String initialsOf(String name) => NextEventPlayerEntity(id: '1', name: name, isConfirmed: true).initials;

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

  test('should return "-" when name is empty', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf(''), '-');
  });

  test('should convert to uppercase', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf('john doe'), 'JD');
    expect(initialsOf('john'), 'JO');
    expect(initialsOf('j'), 'J');
  });

  test('should ignore extra whitespaces', () {
    // Arrange & Act & Assert (AAA)
    expect(initialsOf('John Doe '), 'JD');
    expect(initialsOf(' John Doe'), 'JD');
    expect(initialsOf('John  Doe'), 'JD');
    expect(initialsOf(' John  Doe '), 'JD');
    expect(initialsOf(' John '), 'JO');
    expect(initialsOf(' J '), 'J');
    expect(initialsOf(' '), '-');
    expect(initialsOf('  '), '-');
  });
}
