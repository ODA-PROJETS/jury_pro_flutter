import 'dart:convert';
import 'dart:typed_data';

import 'package:demo/core/domain/Evenement.dart';
import 'package:demo/core/domain/candidat.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailP extends StatelessWidget {
  Candidat candidat;

  DetailP({Key key, this.candidat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) candidat = Candidat.fromJson(arguments['candidat']);

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
          "candidat n°" + candidat.candidat_code,
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
                      "Evenement : " + candidat.evenement.evenement_nom,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ))),
            //Expanded(flex: 5, child: coursePrice)
          ],
        ),
      ],
    );
    String uri = 'data:image/gif;base64,' + candidat.image;
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
    print('nom');
    final bottomContentText = Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Nom : ",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${candidat.candidat_nom}",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
        SizedBox(height:20),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Prenom  : ",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${candidat.candidat_prenom}",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),

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
    );
  }
}
