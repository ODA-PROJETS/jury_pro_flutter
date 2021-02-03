import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:demo/constants/Theme.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
        this.cta = "",
        this.img = "http://via.placeholder.com/200",
        this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    if(img!="http://via.placeholder.com/200"){
    String uri = 'data:image/gif;base64,'+img;
    Uint8List _bytes = base64.decode(uri.split(',').last);
    }
    return Flexible(
        child: Container(
          height: 235,
          child: GestureDetector(
            onTap: tap,
            child: Card(
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(img=="http://via.placeholder.com/200")...[
                    ],
                    Flexible(

                        flex: 2,

                        child: Container(

                            height: 200,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/200.png"),
                                fit: BoxFit.cover,),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.0),
                                  topRight: Radius.circular(6.0)),
                            ))),
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0,),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Text(title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ArgonColors.header, fontSize: 13,fontWeight: FontWeight.w600))),

                            ],
                          ),
                        ))
                  ],
                )),
          ),
        ));
  }
}
