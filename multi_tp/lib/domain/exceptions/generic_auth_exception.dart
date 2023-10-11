class GenericAuthException implements Exception {
  final String message;

  GenericAuthException(this.message);

  @override
  String toString() => message;
}
