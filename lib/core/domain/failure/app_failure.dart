/// A user-safe failure returned by a domain operation.
class AppFailure implements Exception {
  const AppFailure(this.message);

  final String message;
}
