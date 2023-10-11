class EmailAlreadyInUseAuthException implements Exception {
  final String message;

  EmailAlreadyInUseAuthException(this.message);

  @override
  String toString() => message;
}
