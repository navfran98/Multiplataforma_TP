class InvalidEmailAuthException implements Exception {
  final String message;

  InvalidEmailAuthException(this.message);

  @override
  String toString() => message;
}
