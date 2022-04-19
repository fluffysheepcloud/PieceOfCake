import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart' as routes;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chubby Cookie",
      initialRoute: "/",
      // routes: routes.routes,
      theme: ThemeData.from(colorScheme: ColorScheme.light()),
      onGenerateRoute: routes.onGeneratedRoute,

    );
  }
}


// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         titleTextStyle: TextStyle(color: Colors.white),
//         backgroundColor: Colors.deepOrange[900],
//       ),
//       body: Center(
//           child: Column(
//         children: <Widget>[
//           ElevatedButton(
//             child: Text('Customer Login'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CustomerLogin()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               primary: Colors.deepOrange[900],
//             ),
//           ),
//           ElevatedButton(
//             child: Text('Merchant Login'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MerchantLogin()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               primary: Colors.deepOrange[900],
//             ),
//           ),
//           ElevatedButton(
//             child: Text('Create an Account'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AccountRegistrationScreen()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//                 primary: Colors.deepOrange[300], onPrimary: Colors.brown[900]),
//           ),
//         ],
//       )),
//     );
//   }
// }
