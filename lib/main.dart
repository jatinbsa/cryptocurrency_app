import 'dart:async';
import 'dart:convert';

import 'package:cryptocurrency_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List currencies=await getCurrenceis();
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: new HomePage(_currencies),
    );
  }
}
  Future<List> getCurrenceis() async{
    String cryptUrl="https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response=await http.get(cryptUrl);
    return JSON.decode(response.body);
  }




