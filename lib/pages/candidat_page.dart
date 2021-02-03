import 'package:flutter/material.dart';


class CandidatPage extends StatefulWidget {
  

  @override
  _CandidatPageState createState() => _CandidatPageState();
}

class _CandidatPageState extends State<CandidatPage> {

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Jury pro"),
      ),
      body: Center(
       
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CANDIDAT PAGE',
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Ajout',
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
