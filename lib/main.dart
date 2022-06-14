import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_app/ui/firestore_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "test-878c2",
      appId: "1:389755226443:android:03530615ed16e7fde480ce",
      apiKey: "AIzaSyCm-qvBgYBn0XD4d2BF3hoW7GiDmhpaNpo",
      messagingSenderId: "",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirestoreScreen(),
    );
  }
}
