import 'package:flutter/material.dart';
import 'package:frontend/pages/index.dart';
import 'package:frontend/routes/routes.dart' as routes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chubby Cookie",
      initialRoute: "/",
      routes: routes.routes,
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
