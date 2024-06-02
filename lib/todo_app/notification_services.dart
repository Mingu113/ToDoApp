import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class NotificationServices {
  static final _notification = FlutterLocalNotificationsPlugin();
  static Future showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload
}) async => _notification.show(id, title, body, await _notificationDetails(),
  payload: payload);
  static Future showScheduledNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
    required DateTime scheduledDate,
  }) async => _notification.zonedSchedule(id, title, body, TZDateTime.from(scheduledDate, LocationDatabase().get(scheduledDate.timeZoneName)), await _notificationDetails(),
      payload: payload, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        importance: Importance.max,
        icon: 'akaza_akari',
      ),
    );
  }
}
