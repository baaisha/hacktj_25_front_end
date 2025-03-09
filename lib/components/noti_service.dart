import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NotiService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  late IO.Socket socket;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // Initialize notifications and WebSocket connection
  Future<void> initNotification() async {
    if (_isInitialized) {
      return;
    }

    // Initialize local notifications
    const initSettingsAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");
    const initSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);

    const initSettings = InitializationSettings(
        android: initSettingsAndroid, iOS: initSettingsIOS);

    await notificationsPlugin.initialize(initSettings);

    // Initialize WebSocket connection to Flask server
    socket = IO.io('http://10.180.8.138:5001', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      print('Connected to Flask server');
    });

    // Listen for new notifications from the Flask server
    socket.on('new_notification', (data) {
      print('Received notification: $data');
      showNotification(
          title: data['title'], body: data['body']);
    });

    _isInitialized = true;
  }

  // Notification details for local notifications
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', 'Daily Notifications',
            channelDescription: 'Daily Notification Channel',
            importance: Importance.max,
            priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  // Show notification locally
  Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
        print("high");
    return notificationsPlugin.show(
        id, title, body, notificationDetails());
  }
}
