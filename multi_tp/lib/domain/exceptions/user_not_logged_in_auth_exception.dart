class UserNotLoggedInAuthException implements Exception {
  final String message;

  UserNotLoggedInAuthException(this.message);

  @override
  String toString() => message;
}
