import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBkQo19Rg1HQYkr3pGMX8pWmAR7BdwzMvc",
          authDomain: "pitchbox-9db19.firebaseapp.com",
          projectId: "pitchbox-9db19",
          storageBucket: "pitchbox-9db19.appspot.com",
          messagingSenderId: "786693006478",
          appId: "1:786693006478:web:7deff5355dea768a8f55df",
          measurementId: "G-LTMB6M40FX" )
    );
  }else{
    await Firebase.initializeApp();
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
