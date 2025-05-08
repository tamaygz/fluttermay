import 'package:state_notifier/state_notifier.dart';
import '../models/notification_event.dart';

typedef ListenerCallback = void Function(NotificationEvent);

class _SubscriberEntry {
  final String subscriberId;
  final ListenerCallback callback;

  _SubscriberEntry({required this.subscriberId, required this.callback});
}

class FluttermayNotifier
    extends StateNotifier<Map<String, List<_SubscriberEntry>>> {
  FluttermayNotifier() : super({});

  /// Subscribe with a subscriberId for cleanup later
  void subscribe(String channel, ListenerCallback callback,
      {required String subscriberId}) {
    final entry =
        _SubscriberEntry(subscriberId: subscriberId, callback: callback);
    state = {
      ...state,
      channel: [...(state[channel] ?? []), entry]
    };
  }

  /// Remove a specific callback
  void unsubscribe(String channel, ListenerCallback callback) {
    if (!state.containsKey(channel)) return;

    final updated = List.of(state[channel]!);
    updated.removeWhere((entry) => entry.callback == callback);

    state = {
      ...state,
      if (updated.isNotEmpty) channel: updated,
    };
  }

  /// Remove all callbacks for a given subscriber
  void unsubscribeAllFor(String subscriberId) {
    final updated = <String, List<_SubscriberEntry>>{};
    for (final channel in state.keys) {
      final filtered = state[channel]!
          .where((entry) => entry.subscriberId != subscriberId)
          .toList();
      if (filtered.isNotEmpty) {
        updated[channel] = filtered;
      }
    }
    state = updated;
  }

  /// Publish to a specific channel
  void publishOnChannel(String channel, NotificationEvent event) {
    if (!state.containsKey(channel)) return;
    for (var entry in state[channel]!) {
      entry.callback(event);
    }
  }

  /// Publish using the event type as channel
  void publish(NotificationEvent event) {
    final channel = "FM_${event.type.name.toUpperCase()}";
    publishOnChannel(channel, event);
  }

  /// Clear everything
  void clearAllSubscriptions() {
    state = {};
  }
}

// Singleton instance
final fluttermayNotifier = FluttermayNotifier();
