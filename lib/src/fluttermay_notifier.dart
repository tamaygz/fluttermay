import 'package:state_notifier/state_notifier.dart';
import '../../models/notification_event.dart';

class FluttermayNotifier extends StateNotifier<List<NotificationEvent>> {
  FluttermayNotifier() : super([]);

  void notify(NotificationEvent event) {
    state = [...state, event];
  }
}

// Singleton instance to use across projects
final fluttermayNotifier = FluttermayNotifier();
