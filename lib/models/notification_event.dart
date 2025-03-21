enum EventType { state, server, token }

class NotificationEvent {
  final EventType type;
  final String message;
  final DateTime timestamp;

  NotificationEvent({
    required this.type,
    required this.message,
  }) : timestamp = DateTime.now();
}
