import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final List<MaterialColor> _color=[Colors.blue,Colors.indigo,Colors.red];
  @override
  void initState(){
    // TODO: implement initState
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto App"),
      ),
      body: _CryptoWidget(),
    );
  }

  Widget _CryptoWidget(){
    return new Container(
      child: new Column(
        children: <Widget>[
       new Flexible(
      child: new ListView.builder(
      itemCount: widget.currencies.length,
          itemBuilder: (BuildContext context,int index){
            final Map currency=widget.currencies[index];
            final MaterialColor color=_color[index%_color.length];

            return _getListItemUi(currency,color);
          }
      ),
    ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency,MaterialColor color){
    return new ListTile(
       leading: new CircleAvatar(backgroundColor: color,
       child: new Text(currency['name'][0]),
       ),
      title: new Text(currency['name'],
      style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency['price_usd'],currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD,String percentChange){
    TextSpan priceTextWidget=new TextSpan(text:"\$$priceUSD\n",
     style: new TextStyle(color: Colors.black)
    );
    String percentageChangeText="1 hour : $percentChange%";
    TextSpan percentageTextChange;

    if(double.parse(percentChange)>0){
      percentageTextChange=new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Colors.green)
      );
    }
    else{
      percentageTextChange=new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Colors.red));
    }

    return new RichText(
      text: new TextSpan(
        children: [priceTextWidget,percentageTextChange]
      ),
    );
  }
}

    
    