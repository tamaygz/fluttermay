enum EventType { state, server, token }

extension EventTypeExtension on EventType {
  String toUpperCaseString() {
    return name.toUpperCase(); // `name` gives the enum value as a string
  }
}

/// Represents a notification event with a type, message, timestamp, and optional sender.
class NotificationEvent {
  final EventType type;
  final String message;
  final DateTime timestamp;
  final String? sender; // Optional sender information

  NotificationEvent({
    required this.type,
    required this.message,
    this.sender, // Sender is optional
    DateTime? timestamp, // Allow custom timestamp
  }) : timestamp = timestamp ??
            DateTime.now(); // Default to `DateTime.now()` if not provided

  @override
  String toString() {
    return 'NotificationEvent(type: ${type.toUpperCaseString()}, message: $message, sender: ${sender ?? "unknown"}, sent_at: $timestamp)';
  }
}

/// Represents a JWT expiration event with an expiration time.
class JWTExpiringEvent extends NotificationEvent {
  final DateTime expirationTime;

  JWTExpiringEvent({
    required String token,
    required this.expirationTime,
    String? sender, // Optional sender for JWT events
  }) : super(type: EventType.token, message: token, sender: sender);

  @override
  String toString() {
    return 'JWTExpiringEvent(token: $message, expirationTime: $expirationTime, sender: ${sender ?? "unknown"}, sent_at: $timestamp)';
  }
}
