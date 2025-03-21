import 'fluttermay_notifier.dart';
import '../models/notification_event.dart';

class NotificationManager {
  /// Send a message to a specific channel
  static void notify(String channel, String message) {
    fluttermayNotifier.publish(
        channel, NotificationEvent(type: EventType.state, message: message));
  }

  // static void notify(String channel, String message,
  //     {EventType type = EventType.state}) {
  //   fluttermayNotifier.publish(
  //       channel, NotificationEvent(type: type, message: message));
  // }
}
