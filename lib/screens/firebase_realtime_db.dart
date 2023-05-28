import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseRealtimeDB extends StatefulWidget {
  const FirebaseRealtimeDB({Key? key}) : super(key: key);

  @override
  State<FirebaseRealtimeDB> createState() => _FirebaseRealtimeDBState();
}

class _FirebaseRealtimeDBState extends State<FirebaseRealtimeDB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Realtime DB')),
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref().child('temp').onValue,
        builder: (_, snapshot) {
          if (!snapshot.hasData) return const Text('-');
          return Text(snapshot.data!.snapshot.value.toString());
        },
      ),
    );
  }
}
