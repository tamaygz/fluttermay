// import 'package:flutter/material.dart';

// import 'notification_model.dart';

// class NotificationWidget extends StatelessWidget {
//   final NotificationModel notification;

//   const NotificationWidget({Key? key, required this.notification})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color backgroundColor;
//     switch (notification.type) {
//       case NotificationType.warning:
//         backgroundColor = Colors.orange;
//         break;
//       case NotificationType.error:
//         backgroundColor = Colors.red;
//         break;
//       case NotificationType.success:
//         backgroundColor = Colors.green;
//         break;
//       default:
//         backgroundColor = Colors.blue;
//     }

//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4.0),
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             notification.title,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 4.0),
//           Text(
//             notification.message,
//             style: const TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 4.0),
//           Text(
//             DateFormat('yyyy-MM-dd HH:mm:ss').format(notification.timestamp),
//             style: const TextStyle(color: Colors.white70, fontSize: 12.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
