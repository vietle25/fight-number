class AppIAPError {
  /// Creates a new IAP error object with the given error details.
  AppIAPError(
      {required this.source,
      required this.code,
      required this.message,
      this.details});

  /// Which source is the error on.
  final String source;

  /// The error code.
  final String code;

  /// A human-readable error message.
  final String message;

  /// Error details, possibly null.
  final dynamic details;

  @override
  String toString() {
    return 'IAPError(code: $code, source: $source, message: $message, details: $details)';
  }
}
