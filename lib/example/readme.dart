// ff action
import 'package:fluttermay/fluttermay.dart';

void sendServerUpdate(String status) {
  ServerNotifier.updateStatus(status);
}



// channel ff
import 'package:fluttermay/fluttermay.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_util.dart';

void subscribeToChannel(String channel, FFAppState appState) {
  fluttermayNotifier.subscribe(channel, (event) {
    // Update FlutterFlow AppState (so UI can react to changes)
    appState.update(() {
      appState.channelMessages[channel] = event.message;
    });
  });
}


//fff
import 'package:fluttermay/fluttermay.dart';

void unsubscribeFromChannel(String channel) {
  fluttermayNotifier.unsubscribe(channel, (event) {});
}

///
import 'package:fluttermay/fluttermay.dart';

void publishToChannel(String channel, String message) {
  NotificationManager.notify(channel, message);
}

