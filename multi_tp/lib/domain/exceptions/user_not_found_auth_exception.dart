class UserNotFoundAuthException implements Exception {
  final String message;

  UserNotFoundAuthException(this.message);

  @override
  String toString() => message;
}
