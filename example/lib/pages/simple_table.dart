import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

/*
* Cargamos la tabla segun los datos que genere la base de datas despues de la
* consulta de tiempo y lista de consultores
*
* json tiene la consulta decode de lo que trae de la base de datos
* getPrettyJSONString() decodifica el objecto conviertiendolo en un string
*
 */

class SimpleTable extends StatefulWidget {
  SimpleTable(this.json1);
  var json1;
  @override
  _SimpleTableState createState() => _SimpleTableState(json1);
}

class _SimpleTableState extends State<SimpleTable> {
  _SimpleTableState(this.json1);
  var json1='';
  //var jsons =json.decode('[{"Agente":"Cargando","Periodo":"false","Ganancia neta":"false","Costo fijo":"false","Comision":"false","Beneficio":"false"},{"Agente":"Cargando","Periodo":"false","Ganancia neta":"false","Costo fijo":"false","Comision":"false","Beneficio":"false"},{"Agente":"Cargando","Periodo":"false","Ganancia neta":"false","Costo fijo":"false","Comision":"false","Beneficio":"false"}]');
  var jsons;


  void initState () {
    jsons=json.decode(json1);
  }
  bool toggle = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: toggle
            ? Column(
                children: [
  //            for(int i=0;i<5;i++)
                  JsonTable(
                    jsons,
                   // showColumnToggle: true,
                    tableHeaderBuilder: (String header) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            color: Colors.grey[300]),
                        child: Text(
                          header,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Colors.black87),
                        ),
                      );
                    },
                    tableCellBuilder: (value) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.grey.withOpacity(0.5))),
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 14.0, color: Colors.grey[900]),
                        ),
                      );
                    },
                    allowRowHighlight: true,
                    rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              )
            : Center(
                child: Text(getPrettyJSONString(jsons)),
              ),
      ),
    );
  }

  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(jsons.decode(jsonObject));
    return jsonString;
  }
}
