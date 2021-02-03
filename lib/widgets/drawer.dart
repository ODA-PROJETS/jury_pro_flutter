import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:demo/constants/Theme.dart';

import 'package:demo/widgets/drawer-tile.dart';

class ArgonDrawer extends StatelessWidget {
  final String currentPage;

  ArgonDrawer({this.currentPage});

  /*_launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: ArgonColors.white,
      child: Column(children: [
        Container(
           
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              
              bottom: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32,top: 20),
                  child: Row(
                    children: [
                    Image.asset("assets/img/orange_logo.jpg", scale: 1),
                    SizedBox(width: 10.0),
                    Text("JURY PRO",
                    style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                  ],)
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: ListView(
            padding: EdgeInsets.only(top: 30, left: 16, right: 16),
            children: [
              DrawerTile(
                  icon: Icons.home,
                  onTap: () {
                    if (currentPage != "Home")
                      Navigator.pushReplacementNamed(context, '/home');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Home",
                  isSelected: currentPage == "Home" ? true : false),
             
              DrawerTile(
                  icon: Icons.settings_input_component,
                  onTap: () {
                    if (currentPage != "Evenement")
                      Navigator.pushReplacementNamed(context, '/evenement');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Evenement",
                  isSelected: currentPage == "Evenement" ? true : false),
              DrawerTile(
                  icon: Icons.account_circle, 
                  onTap: () {
                    if (currentPage != "Candidat")
                      Navigator.pushReplacementNamed(context, '/candidat');
                  },
                  iconColor: ArgonColors.error,
                  title: "Candidat",
                  isSelected: currentPage == "Candidat" ? true : false),
              DrawerTile(
                  icon: Icons.supervised_user_circle,
                  onTap: () {
                    if (currentPage != "Groupe")
                      Navigator.pushReplacementNamed(context, '/groupe');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Groupe",
                  isSelected: currentPage == "Groupe" ? true : false),
              DrawerTile(
                  icon: Icons.verified_user,
                  onTap: () {
                    if (currentPage != "Jury")
                      Navigator.pushReplacementNamed(context, '/Jury');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Jury",
                  isSelected: currentPage == "Jury" ? true : false),

              DrawerTile(
                  icon: Icons.pie_chart,
                  onTap: () {
                    if (currentPage != "Profile")
                      Navigator.pushReplacementNamed(context, '/profile');
                  },
                  iconColor: ArgonColors.warning,
                  title: "Profile",
                  isSelected: currentPage == "Profile" ? true : false)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 4, thickness: 0, color: ArgonColors.muted),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                    child: Text("EQUIPE ODA",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 15,
                        )),
                  ),
                  
                ],
              )),
        ),
      ]),
    ));
  }
}
