// import 'package:flutter/material.dart';
// import 'package:fluttermay/fluttermay.dart';

// class ServerStatusWidget extends StatefulWidget {
//   @override
//   _ServerStatusWidgetState createState() => _ServerStatusWidgetState();
// }

// class _ServerStatusWidgetState extends State<ServerStatusWidget> {
//   String _serverStatus = "Waiting for updates...";

//   @override
//   void initState() {
//     super.initState();

//     // Subscribe to server updates
//     fluttermayNotifier.subscribe("server_updates", (event) {
//       if (mounted) {
//         setState(() {
//           _serverStatus = event.message;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // Unsubscribe when widget is removed
//     fluttermayNotifier.unsubscribe("server_updates", (event) {});
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text("Server Status: $_serverStatus");
//   }
// }
