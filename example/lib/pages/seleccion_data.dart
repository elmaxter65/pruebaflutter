import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'Date_consultore.dart';


class DateTimePickerExample extends StatefulWidget {
  @override
  _DateTimePickerExampleState createState() {
    return _DateTimePickerExampleState();
  }
}

/*
* Funcion para extraer la fechas y poder realizar la consulta a la base de datos segun la fecha
*
* date1 almacena la informacion de la primera fecha
* date2 almacena la informacion de la segunda fecha
*
 */


class _DateTimePickerExampleState extends State<DateTimePickerExample> {

  DateTime date1;
  DateTime date2;


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Agence'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              initialDate: DateTime(2019, 1, 1),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Fecha inicial',
                  hasFloatingPlaceholder: false
              ),
              onChanged: (dt) {
                setState(() => date1 = dt);
                print('Selected date: $date1');
              },
            ),


            SizedBox(height: 16.0),
            DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              initialDate: DateTime(2019, 1, 1),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Fecha final',
                  hasFloatingPlaceholder: false
              ),
              onChanged: (dt) {
                setState(() => date2 = dt);
              },
            ),


            SizedBox(height: 16.0),


          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.grid_on),
        onPressed: () {
          if(date2!=null && date1!=null)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListTest(date1,date2)),
          );
        }),

  );
}

