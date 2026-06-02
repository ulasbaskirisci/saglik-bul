/// Typed failures for consistent UI messaging and test assertions.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class LoadFailedException extends AppException {
  const LoadFailedException([
    super.message = 'Unable to load providers. Please try again.',
  ]);
}

final class OfflineException extends AppException {
  const OfflineException([
    super.message = 'You appear to be offline. Pull to refresh when back online.',
  ]);
}
