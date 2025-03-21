import 'package:state_notifier/state_notifier.dart';
import '../models/notification_event.dart';
import '../utils/logger.dart';

class TokenNotifier extends StateNotifier<DateTime?> {
  TokenNotifier() : super(null);

  void updateTokenExpiration(DateTime expiration) {
    state = expiration;
    fluttermayNotifier.notify(
      NotificationEvent(
        type: EventType.token,
        message: "API Token expires at: $expiration",
      ),
    );
    Logger.log("Token Expiration Updated: $expiration");
  }

  bool isTokenExpired() {
    return state != null && DateTime.now().isAfter(state!);
  }
}

final tokenNotifier = TokenNotifier();
