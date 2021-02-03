import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:rflutter_alert/rflutter_alert.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List eventPage;
  List data;

  Future fetchEventPages() async {
    final response = await http.get('http://192.168.43.52:8080/evenements');
    data = json.decode(response.body);
    // print("Response : ");
    //print(data);
    setState(() {
      eventPage = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchEventPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Liste des EventPages",
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.deepOrange),
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: eventPage == null ? 0 : eventPage.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Image.network(
                              "https://ayanawebzine.com/wp-content/uploads/2019/11/new-zaouli.jpg",
                              fit: BoxFit.fill, loadingBuilder:
                                  (BuildContext context, Widget child,
                                      ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            ListTile(
                              title: Center(
                                  child: Text(
                                      "${eventPage[index]["evenement_nom"]}")),
                              subtitle: Text( 
                                "Type : ${eventPage[index]["evenement_type"]}",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Du ${eventPage[index]["evenement_date_debut"]} au ${eventPage[index]["evenement_date_fin"]}",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                    textColor: Colors.deepOrange,
                                    color: Colors.black,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Modifier'),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => EventPageCreateOrUpdate()));
          // TestCreate();
          //EventPageCreateOrUpdate();
        },
        label: Text(
          'Ajouter',
          style: TextStyle(color: Colors.black),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
