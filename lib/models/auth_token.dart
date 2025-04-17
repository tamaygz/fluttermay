/// Represents an authentication token with expiration and optional related IDs.
class AuthToken {
  final String token;
  final String? relatedFirebaseId;
  final String? relatedBackendId;
  final DateTime expirationDate;

  AuthToken({
    required this.token,
    this.relatedFirebaseId,
    this.relatedBackendId,
    required this.expirationDate,
  });

  /// Checks if the token is expired.
  bool isExpired() => DateTime.now().isAfter(expirationDate);

  /// Checks if the token is valid (not expired).
  bool isValid() => !isExpired();

  /// Checks if the token is valid for at least the specified number of minutes.
  bool isValidForMinutes(int minutes) {
    final expirationThreshold = DateTime.now().add(Duration(minutes: minutes));
    return expirationDate.isAfter(expirationThreshold);
  }

  @override
  String toString() {
    return 'AuthToken(token: $token, relatedFirebaseId: $relatedFirebaseId, relatedBackendId: $relatedBackendId, expirationDate: $expirationDate)';
  }
}
