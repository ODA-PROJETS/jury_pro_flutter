import 'dart:io';

import 'package:demo/constants/Variable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EvenementService {
  //static const API = http.get('http://169.254.216.218:8080/evenements');
  static List data=[];
  static Future<List> fetchEvenements() async {
    try{
    final response = await http.get(Variable.base_url + 'evenements');
    if (response.statusCode != 200) data = [];
    data = json.decode(response.body);
    return data;
    }on SocketException {
      return data;
    }

  }
}
