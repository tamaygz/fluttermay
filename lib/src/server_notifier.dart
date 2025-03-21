import 'fluttermay_notifier.dart';
import '../models/notification_event.dart';

class ServerNotifier {
  static void updateStatus(String newStatus) {
    fluttermayNotifier.publish(
        "server_updates",
        NotificationEvent(
            type: EventType.server, message: "Server: $newStatus"));
  }
}
