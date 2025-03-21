import 'package:state_notifier/state_notifier.dart';
import '../models/notification_event.dart';
import '../utils/logger.dart';

class ServerNotifier extends StateNotifier<String> {
  ServerNotifier() : super("Idle");

  void updateStatus(String newStatus) {
    state = newStatus;
    fluttermayNotifier.notify(
      NotificationEvent(type: EventType.server, message: "Server: $newStatus"),
    );
    Logger.log("Server Status Updated: $newStatus");
  }
}

final serverNotifier = ServerNotifier();
