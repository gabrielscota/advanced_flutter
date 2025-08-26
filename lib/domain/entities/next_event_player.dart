class NextEventPlayerEntity {
  final String id;
  final String name;
  final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayerEntity._({
    required this.id,
    required this.name,
    required this.initials,
    this.photo,
    this.position,
    required this.isConfirmed,
    this.confirmationDate,
  });

  factory NextEventPlayerEntity({
    required String id,
    required String name,
    String? photo,
    String? position,
    required bool isConfirmed,
    DateTime? confirmationDate,
  }) => NextEventPlayerEntity._(
    id: id,
    name: name,
    initials: _getInitials(name),
    photo: photo,
    position: position,
    isConfirmed: isConfirmed,
    confirmationDate: confirmationDate,
  );

  static String _getInitials(String name) {
    final List<String> nameParts = name.toUpperCase().trim().split(' ');
    final String firstChar = nameParts.first.split('').firstOrNull ?? '-';
    final String lastChar = nameParts.last.split('').elementAtOrNull(nameParts.length == 1 ? 1 : 0) ?? '';

    return '$firstChar$lastChar';
  }
}
