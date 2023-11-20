import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/UploadFeatures/HomePage.dart';
import 'package:flutter_my_app/AllScreens/loginScreen.dart';
import 'package:flutter_my_app/AllScreens/mainscreen.dart';
import 'package:flutter_my_app/AllScreens/registrationScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // name = "flutter_my_app",
    // options: FirebaseOptions(
    //   apiKey: "AIzaSyCuWNsCnlNSs8hYYbCtQ-Rgohy2g-derT4",
    //   databaseURL: "https://uber-clone-fdd32-default-rtdb.firebaseio.com",
    //   appId: "1:659467196024:android:db400df29bd59a0cfc3f8d",
    //   messagingSenderId: "659467196024",
    //   projectId: "uber-clone-fdd32",
    // ),
  );
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child('Users');

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => AppData(),
    //   child: MaterialApp(

    return FutureBuilder(
      future: _initilization,
    builder: (context, snapshot) {
        if(snapshot.hasError) {
          print("Something went Wrong");
        }

        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "Flutter App",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }
        return CircularProgressIndicator();
    },);
    return MaterialApp(
      title: 'Rider App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      // initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
      // routes:
      // {
      //   RegistrationScreen.idScreen: (context) => RegistrationScreen(),
      //   LoginScreen.idScreen: (context) => LoginScreen(),
      //   MainScreen.idScreen: (context) => MainScreen(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }

}

// DatabaseReference usersRef = FirebaseDatabase.instance.reference().child('Users');
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // return ChangeNotifierProvider(
//     //   create: (context) => AppData(),
//     //   child: MaterialApp(
//     return MaterialApp(
//       title: 'Rider App',
//       theme: ThemeData(
//         fontFamily: "Brand Bold",
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//       // initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
//       // routes:
//       // {
//       //   RegistrationScreen.idScreen: (context) => RegistrationScreen(),
//       //   LoginScreen.idScreen: (context) => LoginScreen(),
//       //   MainScreen.idScreen: (context) => MainScreen(),
//       // },
//       debugShowCheckedModeBanner: false,
//     );
//   }
//
// }
