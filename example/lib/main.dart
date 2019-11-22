import 'package:example/pages/seleccion_data.dart';
import 'package:example/pages/table_load.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateTimePickerExample(),
    );
  }
}
