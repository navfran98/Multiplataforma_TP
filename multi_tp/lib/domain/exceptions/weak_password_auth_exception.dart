class WeakPasswordAuthException implements Exception {
  final String message;

  WeakPasswordAuthException(this.message);

  @override
  String toString() => message;
}
