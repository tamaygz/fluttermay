import 'fluttermay_notifier.dart';
import '../models/notification_event.dart';

class NotificationManager {
  static void notifyStateChange(String message) {
    fluttermayNotifier.notify(
      NotificationEvent(type: EventType.state, message: message),
    );
  }
}
