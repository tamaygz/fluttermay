import 'fluttermay_notifier.dart';
import '../models/notification_event.dart';

class TokenNotifier {
  static void updateTokenExpiration(DateTime expiration) {
    fluttermayNotifier.publishOnChannel(
        "token_expiry",
        NotificationEvent(
            type: EventType.token, message: "Token expires at: $expiration"));
  }

  // static void batchUpdate(List<String> updates) {
  // for (var update in updates) {
  //   updateStatus(update);
  // }
}
