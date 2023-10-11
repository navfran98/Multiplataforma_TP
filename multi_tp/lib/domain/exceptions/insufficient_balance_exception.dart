class InsufficientBalanceException implements Exception {
  final String message;

  InsufficientBalanceException(this.message);

  @override
  String toString() => message;
}
