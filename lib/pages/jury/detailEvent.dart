import 'package:demo/constants/Theme.dart';
import 'package:demo/core/domain/Evenement.dart';
import 'package:demo/widgets/card-horizontal-p.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class DetailVote extends StatelessWidget {
  Evenement evenement;

  DetailVote({Key key, this.evenement}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null)
      evenement = Evenement.fromJson(arguments['evenement']);

    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 10.2,
            valueColor: AlwaysStoppedAnimation(Colors.deepOrange)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        evenement.participant.toString() + " participant(s)",
        style: TextStyle(color: Colors.white),
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
          evenement.evenement_nom,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
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
                      "type : " + evenement.evenement_type,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 5, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage("http://via.placeholder.com/200"),
                fit: BoxFit.cover,
              ),
            )),
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

    final bottomContentText = Text(
      "description de l'evenement " + evenement.evenement_nom,
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            //bottomContentText,
            Card(
              elevation: 0.6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "candidat 1",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              bottomLeft: Radius.circular(6.0)),
                        )),
                  ),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlatButton.icon(
                                onPressed: () => _openPopup(context),
                                icon: Icon(Icons.edit),
                                label: Text('')),
                          ],
                        ),
                      ))
                ],
              ),
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

  _openPopup(context) {
    Alert(
        context: context,
        title: "NOTE CANDIDAT 1",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.book),
                labelText: 'note',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.deepOrange,

            onPressed: () => Navigator.pop(context),
            child: Text(
              "VALIDER",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
