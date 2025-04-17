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

  /// Unsubscribe from a specific channel/topic
  void unsubscribe(String channel, ListenerCallback callback) {
    if (state.containsKey(channel)) {
      final updatedCallbacks = List.of(state[channel]!);
      updatedCallbacks.remove(callback);

      state = {
        ...state,
        if (updatedCallbacks.isNotEmpty) channel: updatedCallbacks,
      };
    }
  }

  /// Publish a notification to a specific channel
  void publishOnChannel(String channel, NotificationEvent event) {
    if (!state.containsKey(channel)) {
      print('Warning: No listeners subscribed to channel $channel');
      return;
    }
    for (var callback in state[channel]!) {
      callback(event);
    }
  }

  /// Publish a notification based on the event type as the channel
  void publish(NotificationEvent event) {
    final channel = "FM_${event.type.name.toUpperCase()}";
    publishOnChannel(channel, event);
  }

  /// Clear all subscriptions
  void clearAllSubscriptions() {
    state = {};
  }
}

// Singleton instance
final fluttermayNotifier = FluttermayNotifier();
