import 'package:firebase_database/firebase_database.dart';


class FirebaseDemoScreen{

  final databaseReference = FirebaseDatabase.instance.reference();

  void createRecord(){
  databaseReference.child("1").set({
    'title': 'Mastering EJB',
    'description': 'Programming Guide for J2EE'
  });
  databaseReference.child("2").set({
    'title': 'Flutter in Action',
    'description': 'Complete Programming Guide to learn Flutter'
  });
}
String getData(){
    String A;
  databaseReference.once().then((DataSnapshot snapshot) {
    A=snapshot.value.toString();
  });
    var db = FirebaseDatabase.instance.reference().child("0").child("cao_usuario");
    db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        print(values);
      });
    });
  return A;
}

void updateData(){
  databaseReference.child('1').update({
    'description': 'J2EE complete Reference'
  });
}

void deleteData(){
  databaseReference.child('1').remove();
}
}