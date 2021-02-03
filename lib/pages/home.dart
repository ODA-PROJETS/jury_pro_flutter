import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../pages/event_page.dart';
import '../pages/candidat.dart';
import '../pages/jury.dart';

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeAppState();
  }
}

class HomeAppState extends State<HomeApp> {
  int _selectedTab = 1;
  final _pageOptions = [
    Candidat(),
    EventPage(),
    Jury(),
  ];
  PageController _controller = new PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: PageView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _controller,
        onPageChanged: (int) {
          _selectedTab = int;
          setState(() {});
        },
        children: _pageOptions,
      ),
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: ClipRRect(
//            borderRadius: BorderRadius.all(
//              Radius.circular(10),
//            ),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              backgroundColor: Colors.white, //Color(0xff222831),
              elevation: 0,
              currentIndex: _selectedTab,
              fixedColor: Colors.deepOrangeAccent, //Color(0xff0E4F61)
              unselectedItemColor: Colors.grey,
              onTap: (int index) {
                setState(() {
                  _controller.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_outlined),
                  title: Text(
                    'Candidat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  //backgroundColor: Colors.red,
                  title: Text(
                    'Evenement',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(
                    'Jury',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
