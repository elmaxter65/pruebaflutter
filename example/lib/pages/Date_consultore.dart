import 'dart:convert';
import 'package:example/firebase/cao_permissao.dart';
import 'package:example/firebase/funciones_firebase.dart';
import 'package:example/firebase/cao_usuario.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:http/http.dart' as http;
import 'package:example/pages/table_load.dart';
import 'package:flutter/material.dart';

class ListTest extends StatefulWidget {
  ListTest(this.date1, this.date2);

  DateTime date1;
  DateTime date2;

  @override
  _ListTestState createState() => new _ListTestState();
}

/*
* se carga la lista de consultores desde la base de datos para luego cargar los
* seleccionados y realizar la consulta
*
* isSelected indica el select
*_id marca el que sea seleccionado de la list
* data el que contiene la informacion traida de la base de datos
* getdata() realiza la consulta a la base de datos
*list_confirmada() genera lista con los valores marcados por los usuarios
* toggleSelection() genera las marcas segun las opciones del usuario
 */
class _ListTestState extends State<ListTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var isSelected = false;
  List<Caousuario> data=new List<Caousuario>();
  DateTime date1;
  DateTime date2;
  var listado;
  var json1;
  bool _anchorToBottom = false;
  FirebaseDemoScreen fire= new FirebaseDemoScreen();


  void initState() {
    date1 = widget.date1;
    date2 = widget.date2;

  }




  @override
  Widget build(BuildContext context) {

    Widget _buildTitle(BuildContext context) {
      return new InkWell(
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Registro de Agentes',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }


    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),

      ),
      body: prueba(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.grid_on),
            onPressed: () {

            if(date2!=null && date1!=null && data!=null)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RootPage(date1,date2,fire.getDataconsulta(data))),
              );
          }),
    );

  }

  FirebaseAnimatedList prueba ()
  {
    DataSnapshot snapshot;
    FirebaseAnimatedList resulta=  new FirebaseAnimatedList(
      key: new ValueKey<bool>(_anchorToBottom),
      query: fire.getDatauser(),
      reverse: _anchorToBottom,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {

        return new SizeTransition(
          sizeFactor: animation,
          child: showUser(snapshot),
        );
      },
    );

     return resulta;
  }

  Widget showUser(DataSnapshot res) {
    Caopermissao permiso = Caopermissao.fromSnapshot(res);
    Caousuario user = Caousuario.fromSnapshot(fire.getData());

    print(res.value);


  var item = new Card(
    child: new Container(
        child: new Center(
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                radius: 30.0,
                child: new Text("F"),
                backgroundColor: const Color(0xFF20283e),
              ),

              new Expanded(
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        user.no_usuario,

                        // set some style to text
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.lightBlueAccent),
                      )
                    ],
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: const Color(0xFF167F67),
                    ),
                    onPressed: () => data.add(user),
                  ),
                  new IconButton(
                    icon: const Icon(Icons.delete_forever,
                        color: const Color(0xFF167F67)),
                    onPressed: () => data.remove(user),
                  ),
                ],
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
  );


  return item;



  }
  FirebaseAnimatedList showpermiso(DataSnapshot res) {
    Caousuario user = Caousuario.fromSnapshot(res);

    //Caopermissao permiso = Caopermissao.fromSnapshot(res);
   return FirebaseAnimatedList(
      key: new ValueKey<bool>(_anchorToBottom),
      query: fire.getDatauser(),
      reverse: _anchorToBottom,
      sort: _anchorToBottom
          ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
          : null,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        print(snapshot.value);
        return new SizeTransition(
          sizeFactor: animation,
          child: showUser(snapshot),
        );
      },
    );
  }



}
