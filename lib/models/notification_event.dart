enum EventType { state, server, token }

class NotificationEvent {
  final EventType type;
  final String message;
  final DateTime timestamp;

  NotificationEvent({
    required this.type,
    required this.message,
  }) : timestamp = DateTime.now();

  @override
  String toString() {
    return 'NotificationEvent(type: $type, message: $message, sent_at: $timestamp)';
  }
}

class JWTExpiringEvent extends NotificationEvent {
  final DateTime expirationTime;

  JWTExpiringEvent({
    required String token,
    required this.expirationTime,
  }) : super(type: EventType.token, message: token);

  @override
  String toString() {
    return 'JWTExpiringEvent(token: $message, expirationTime: $expirationTime, sent_at: $timestamp)';
  }
}
