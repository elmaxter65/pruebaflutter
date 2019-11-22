import 'dart:convert';

import 'package:example/bar_chart/simple.dart';
import 'package:example/pie_chart/simple.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'simple_table.dart';

class RootPage extends StatelessWidget {
  RootPage(this.date1, this.date2, this.data, this.json);

  DateTime date1;
  DateTime date2;
  List data;
  var json;

  Future<List> getData() async {
    var url = "http://127.0.0.1/my_store/getdata.php";
    final response = await http.post(url, body: {
      "consultoritem": data,
      "fecha_ini": date1,
      "fecha_final": date2
    });
    var json1 = jsonDecode('[{"no_usuario":"Cargando"}]');
    return jsonDecode(json1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agence"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Relatorio",
              ),
              Tab(
                text: "Grafico",
              ),
              Tab(
                text: "Pizza",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SimpleTable(json),
            SimpleBarChart.withRandomData(json),
            SimplePieChart.withRandomData(json)
          ],
        ),
      ),
    );
  }
}
