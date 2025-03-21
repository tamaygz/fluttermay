import '../fluttermay_notifier.dart';
import '../models/notification_event.dart';

class TokenNotifier {
  static void updateTokenExpiration(DateTime expiration) {
    fluttermayNotifier.publish(
        "token_expiry",
        NotificationEvent(
            type: EventType.token, message: "Token expires at: $expiration"));
  }
}
