import 'package:local_notifications/src/services/notification_service.dart';
import 'package:local_notifications/src/util/exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.indigo.shade900,
          appBarTheme: AppBarTheme(color: Colors.indigo.shade900)),
      home: Homepage(),
    );
  }
}