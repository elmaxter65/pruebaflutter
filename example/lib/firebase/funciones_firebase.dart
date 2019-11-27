import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'cao_usuario.dart';
import 'cao_permissao.dart';

class FirebaseDemoScreen {
  final databaseReference = FirebaseDatabase.instance.reference();

  void createRecord() {
    databaseReference.child("1").set({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    });
    databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }

  getData() {
    return databaseReference.reference().child("cao_usuario").limitToFirst(10);
  }
  getDatauser() {
    return databaseReference.reference().child("permissao_sistem").limitToFirst(10);
  }
  getDataconsulta(List agentes) {
    print("mostramos");
    var jsones = '';
    String dato = '[';
    String datos = '';
    var x = 0;
    for (Caousuario agente in agentes) {
      if (x == 0)
        datos =
            '{"Agente":"${agente.no_usuario.toString()}","Periodo":"false","Ganancia neta":"false","Costo fijo":"false","Comision":"false","Beneficio":"false"}';
      else
        datos =
            '{"Agente":"${agente.no_usuario.toString()}","Periodo":"false","Ganancia neta":"false","Costo fijo":"false","Comision":"false","Beneficio":"false"},${datos}';

      print(getDatauser());
      x++;
    }
    dato = dato + datos + ']';
    dato = json.encode(dato);
    jsones = json.decode(dato);
    return jsones;
  }

  void updateData() {
    databaseReference
        .child('1')
        .update({'description': 'J2EE complete Reference'});
  }

  void deleteData() {
    databaseReference.child('1').remove();
  }
}
