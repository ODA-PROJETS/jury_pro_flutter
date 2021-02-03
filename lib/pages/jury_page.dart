import 'package:flutter/material.dart';


class JuryPage extends StatefulWidget {
  

  @override
  _JuryPageState createState() => _JuryPageState();
}

class _JuryPageState extends State<JuryPage> {

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
              'JURY PAGE',
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
