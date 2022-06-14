import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_app/ui/firestore_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "test-951ed",
      appId: "1:60968821133:android:b30def7a930b12ad9e9dc4",
      apiKey: "AIzaSyAGtszGAKflbVnThotTp5aIgRjVqZNWfvE",
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
