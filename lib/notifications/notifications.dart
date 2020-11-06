import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {

  BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(BuildContext context) async{
    this._context = context;
    //-----------------------------| Inicialize local notifications |--------------------------------------
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    return flutterLocalNotificationsPlugin;
    //======================================================================================================
  }



  //---------------------------------| Show the notification in the specific time |-------------------------------
  Future showNotification(String title, String description, int time, int id,FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    print(id);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id.toInt(),
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'medicines_id', 'medicines', 'medicines_notification_channel',
                importance: Importance.high,
                priority: Priority.high,
                color: Colors.cyanAccent)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

  //================================================================================================================




  void removeNotify(int notifyId){

  }


  //-------------| function to inicialize local notifications |---------------------------
  Future onSelectNotification(String payload) async {
    showDialog(
      context: _context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
//======================================================================================


}