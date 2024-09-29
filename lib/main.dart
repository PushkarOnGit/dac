import 'package:dac/auth/user_status.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD8Vpcklb5jqqgpzNtyFdxToC3dLyc2GSc",// current_key in google-services.json file
      appId: "1:34653255762:android:5e33e2e5d7efa425b6478b", // mobilesdk_app_id in google-services.json file
      messagingSenderId: "34653255762", // project_number in google-services.json file
      projectId: "34653255762", // project_id in google-services.json file
    ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the icon color globally
          ),
        ),
      ),
      home: start(),
    );
  }
}
