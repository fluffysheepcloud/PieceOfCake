import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart' as routes;
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');
  //
  // messaging.subscribeToTopic("all");
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

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
      theme: ThemeData(//0 x ab8967
        //using primary color as container backgrounds
        //   fontFamily: 'Solway',
        textTheme: GoogleFonts.spectralTextTheme(),
      textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.brown),

        primaryColor: Color(0xFFF2E1CE),
          //colorScheme: ColorScheme.fromSwatch(primarySwatch: Color(0xffe3d2bc)),
        scaffoldBackgroundColor: Color(0xffFAF3EA),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.getFont('Pacifico', fontSize: 25),
          backgroundColor: Color(0xFFA16340)
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: Color(0xFF804E32)//
        ),
    ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xFF804E32),
            ),

          )

      ),
      //.from(colorScheme: ColorScheme.light()),
      onGenerateRoute: routes.onGeneratedRoute,
      //theme


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
