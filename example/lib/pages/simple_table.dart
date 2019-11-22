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
  SimpleTable(this.json);
  var json;
  @override
  _SimpleTableState createState() => _SimpleTableState();
}

class _SimpleTableState extends State<SimpleTable> {
  var json;

  void initState () {
    json=widget.json;
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

                  JsonTable(
                    json,
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
                child: Text(getPrettyJSONString(json)),
              ),
      ),
    );
  }

  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(json.decode(jsonObject));
    return jsonString;
  }
}
