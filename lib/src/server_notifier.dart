import 'fluttermay_notifier.dart';
import '../models/notification_event.dart';

class ServerNotifier {
  static void updateStatus(String newStatus) {
    fluttermayNotifier.publishOnChannel(
        "server_updates",
        NotificationEvent(
            type: EventType.server, message: "Server: $newStatus"));
  }

  static void batchUpdate(List<String> updates) {
    for (var update in updates) {
      updateStatus(update);
    }
  }
}
