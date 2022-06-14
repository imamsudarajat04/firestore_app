import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({Key? key}) : super(key: key);
  @override
  _FirestoreScreenKaryawanState createState() =>
      _FirestoreScreenKaryawanState();
}

class _FirestoreScreenKaryawanState extends State<FirestoreScreen> {
  final TextEditingController? _controllerTxtPerintah = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference iot = FirebaseFirestore.instance.collection('iot');

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateFirestore(String? value) {
    print("send perintah");
    return iot.doc('perintah').update({'lampu': value}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil")));
    }).catchError((error) {
      print("$error");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update firestore")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firestore View",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _controllerTxtPerintah,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Perintah",
                  ),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String? perintah = _controllerTxtPerintah!.text.toString();
                    updateFirestore(perintah);
                  },
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
