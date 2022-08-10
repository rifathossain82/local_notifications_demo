import 'package:flutter/material.dart';
import 'package:local_notifications/src/services/notification_service.dart';
import 'package:local_notifications/src/view/screen/secondScreen.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {

    _notificationService.initNotification();
    _notificationService.onNotifications.listen((value) {
      onClickNotification(value);
    });

    super.initState();
  }

  void onClickNotification(String? _payload){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(payload: _payload)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Locale Notification Demo'),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Show Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () => NotificationService().showNotifications(
                        title: 'Simple Notification',
                        body: 'Hello Rifat. This is a simple notification.',
                        payload: 'hello.com'),
                  ),
                  const SizedBox(height: 3),

                  RaisedButton(
                    child: Text('Schedule Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () =>
                        NotificationService()
                          .showScheduleNotification(
                          001,
                          'Schedule Notification',
                          'Hello Rifat. This is a schedule notification.',
                          5,
                          'bparatoday.com'
                        ),
                  ),
                  const SizedBox(height: 3),

                  RaisedButton(
                    child: Text('Cancel Notification'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () =>
                        NotificationService().cancelNotifications(001),
                  ),
                  const SizedBox(height: 3),

                  RaisedButton(
                    child: Text('Cancel All Notifications'),
                    padding: const EdgeInsets.all(10),
                    onPressed: () =>
                        NotificationService().cancelAllNotifications(),
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            )));
  }
}
