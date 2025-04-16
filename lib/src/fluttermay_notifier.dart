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

  // /// Unsubscribe from a specific channel
  // void unsubscribe(String channel, ListenerCallback callback) {
  //   if (state.containsKey(channel)) {
  //     state[channel]!.remove(callback);\
  //     if (state[channel]!.isEmpty) {
  //       final newState = {...state};
  //       newState.remove(channel);
  //       state = newState;
  //     } else {
  //       state = {...state};
  //     }
  //   }
  // }

  // unsub
  void unsubscribe(String channel, ListenerCallback callback) {
    if (state.containsKey(channel)) {
      state[channel]!.remove(callback);
      if (state[channel]!.isEmpty) {
        state.remove(channel); // Auto-remove empty channels
      }
    }
  }

  /// Publish a notification to a specific channel
  void publishOnChannel(String channel, NotificationEvent event) {
    print('Debug: Sending message on channel $channel with event $event');
    if (state.containsKey(channel)) {
      for (var callback in state[channel]!) {
        callback(event);
      }
    }
  }

  /// Publish a notification based on the event type as the channel
  void publish(NotificationEvent event) {
    final channel = "FM_${event.type.name.toUpperCase()}";
    publishOnChannel(channel, event);
  }
}

// Singleton instance
final fluttermayNotifier = FluttermayNotifier();
