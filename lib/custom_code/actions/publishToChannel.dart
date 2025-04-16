import 'package:fluttermay/fluttermay.dart';

void publishToChannel(String channel, String message) {
  NotificationManager.notify(channel, message);
}
