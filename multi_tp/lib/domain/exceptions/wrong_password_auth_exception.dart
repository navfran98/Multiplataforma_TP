class WrongPasswordAuthException implements Exception {
  final String message;

  WrongPasswordAuthException(this.message);

  @override
  String toString() => message;
}
