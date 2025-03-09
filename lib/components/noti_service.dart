import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NotiService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  late IO.Socket socket;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: initSettingsAndroid, 
      iOS: initSettingsIOS
    );

    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  void connectSocket() {
    socket = IO.io('http://10.180.8.138:5001', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      print('Connected to Flask server');
    });

    socket.on('new_notification', (data) {
      print('Received notification: $data');
      showNotification(
        title: data['title'], 
        body: data['body']
      );
    });

    socket.connect();
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', 
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high
      ),
      iOS: DarwinNotificationDetails()
    );
  }

  Future<void> showNotification({int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }
}