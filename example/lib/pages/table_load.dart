import 'dart:convert';

import 'package:example/bar_chart/simple.dart';
import 'package:example/firebase/funciones_firebase.dart';
import 'package:example/pie_chart/simple.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'simple_table.dart';

class RootPage extends StatelessWidget {
  RootPage(this.date1, this.date2, this.data);

  DateTime date1;
  DateTime date2;
  var data;


void initState(){


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
            SimpleTable(data),
            SimpleBarChart.withRandomData(data),
            SimplePieChart.withRandomData(data),

        ],
        ),
      ),
    );
  }
}
