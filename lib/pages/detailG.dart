import 'dart:convert';
import 'dart:typed_data';

import 'package:demo/core/domain/Evenement.dart';
import 'package:demo/core/domain/groupe.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailG extends StatelessWidget {
  Groupe groupe;

  DetailG({Key key, this.groupe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) groupe = Groupe.fromJson(arguments['groupe']);

    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 10.2,
            valueColor: AlwaysStoppedAnimation(Colors.deepOrange)),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.event_available,
          color: Colors.white,
          size: 40.0,
        ),
        // Container(
        //   width: 90.0,
        //   child: new Divider(color: Colors.deepOrange),
        // ),
        SizedBox(height: 10.0),
        levelIndicator,

        Text(
          "groupe n°" + groupe.groupe_code,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Evenement : " + groupe.evenement.evenement_nom,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ))),
            //Expanded(flex: 5, child: coursePrice)
          ],
        ),
      ],
    );
    String uri = 'data:image/gif;base64,' + groupe.image;
    Uint8List _bytes = base64.decode(uri.split(',').last);
    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.memory(_bytes),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Nom du groupe : ",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${groupe.groupe_nom}",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
        SizedBox(height:50),
        Text("LISTE DES CANDIDATS",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height:20),
        Table(

//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
          border: TableBorder.all(
              color: Colors.black26, width: 1, style: BorderStyle.none
          ),
          children: [
            TableRow(children: [
              TableCell(child: Center(child: Text('code'))),
              TableCell(
                child: Center(child: Text('Nom')),
              ),
              TableCell(child: Center(child: Text('Prenom'))),
              TableCell(child: Center(child: Text('Numero'))),
            ]),
            TableRow(children: [
              TableCell(
                child: Center(child: Text('000 1')),
                //verticalAlignment: TableCellVerticalAlignment.bottom,
              ),
              TableCell(
                //verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text('nom 1')),
              ),
              TableCell(
                //verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text('prenom 1')),
              ),
              /*TableCell(
                  child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ValueaaValueaaValueaaValueaaValueaaValueaaValueaa',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ))),*/
              TableCell(
                child: Center(child: Text('1278655656')),
                verticalAlignment: TableCellVerticalAlignment.top,
              ),
            ]),
            TableRow(children: [
              TableCell(
                child: Center(child: Text('0003')),
                //verticalAlignment: TableCellVerticalAlignment.bottom,
              ),
              TableCell(
                //verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text('nom 2')),
              ),
              TableCell(
                //verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text('prenom 3')),
              ),
              TableCell(
                child: Center(child: Text('12456')),
                verticalAlignment: TableCellVerticalAlignment.top,
              ),
            ]),

          ],
        ),
        SizedBox(height:100),

      ],
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Text("Modifier", style: TextStyle(color: Colors.white)),
        ));
    final deleteButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Text("supprimer", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Expanded(flex: 1, child: levelIndicator),
                Expanded(flex: 2, child: readButton),
                Expanded(flex: 1, child: Container()),
                Expanded(flex: 2, child: deleteButton)
              ],
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context, builder: (ctx) => _buildBottomSheet(ctx)),
        tooltip: 'Ajout',
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const ListTile(
              title: Text('AJOUTER UN CANDIDAT A CE GROUPE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 10),


          SizedBox(height: 50),

          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
              onPressed: null,
              icon: Icon(Icons.save),
              label: Text("valider"),
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
