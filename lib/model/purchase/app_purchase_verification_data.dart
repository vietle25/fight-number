class AppPurchaseVerificationData {
  AppPurchaseVerificationData({
    required this.localVerificationData,
    required this.serverVerificationData,
    required this.source,
  });

  /// The data used for local verification.
  ///
  /// The data is formatted according to the specifications of the respective
  /// store. You can use the [source] field to determine the store from which
  /// the data originated and proces the data accordingly.
  final String localVerificationData;

  /// The data used for server verification.
  final String serverVerificationData;

  /// Indicates the source of the purchase.
  final String source;
}
