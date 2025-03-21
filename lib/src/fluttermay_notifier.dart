import 'package:state_notifier/state_notifier.dart';
import '../models/notification_event.dart';

typedef ListenerCallback = void Function(NotificationEvent);

class FluttermayNotifier
    extends StateNotifier<Map<String, List<ListenerCallback>>> {
  FluttermayNotifier() : super({});

  /// Subscribe to a specific channel/topic
  void subscribe(String channel, ListenerCallback callback) {
    state = {
      ...state,
      channel: [...(state[channel] ?? []), callback]
    };
  }

  /// Unsubscribe from a specific channel
  void unsubscribe(String channel, ListenerCallback callback) {
    if (state.containsKey(channel)) {
      state[channel]!.remove(callback);
      if (state[channel]!.isEmpty) {
        final newState = {...state};
        newState.remove(channel);
        state = newState;
      } else {
        state = {...state};
      }
    }
  }

  /// Publish a notification to a specific channel
  void publish(String channel, NotificationEvent event) {
    if (state.containsKey(channel)) {
      for (var callback in state[channel]!) {
        callback(event);
      }
    }
  }
}

// Singleton instance
final fluttermayNotifier = FluttermayNotifier();
