import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MostAffected extends StatefulWidget {
  @override
  _MostAffectedState createState() => _MostAffectedState();
}

class _MostAffectedState extends State<MostAffected> {


  List data;
  
  Future fetch () async {
    http.Response response;
    response = await http.get("https://corona.lmao.ninja/v2/countries?yesterday=true&sort=cases");
    if(response.statusCode == 200) {
      setState(() {
      data = json.decode(response.body);  
      });
      
    }
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(title: Text("Top 10 most affected Countries", style: TextStyle(fontSize:16,)),),
        body: data == null ? Center(child: CircularProgressIndicator()) : ListView.builder(itemCount: 10,itemBuilder: (context, index) {
        return 
        MostAffectedStat(data: data, countryName: data[index]["country"], flagpath: data[index]["countryInfo"]["flag"], deaths: data[index]["deaths"].toString());
        }
    )
    );
  }
}

class MostAffectedStat extends StatefulWidget {
  const MostAffectedStat({
    Key key, this.countryName, this.flagpath, this.deaths,
    @required this.data,
  }) : super(key: key);

  final List data;
  final String countryName;
  final String flagpath;
  final String deaths;

  @override
  _MostAffectedStatState createState() => _MostAffectedStatState();
}

class _MostAffectedStatState extends State<MostAffectedStat> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
          margin:  EdgeInsets.symmetric(horizontal:10, vertical: 10),
          width: double.infinity,
          height:140,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius:20, color:Colors.white)]
            ),
          child: Container(
          
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[

                      Text(widget.countryName, style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Container(
                    width: 130,
                    height: 80,
                    color: Colors.transparent,
                    child: Image.network(widget.flagpath)
                  ),
                ],
              ),
              Container(
                margin:EdgeInsets.only(top:20),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("DEATHS", style: TextStyle(color: Colors.red, fontSize: 20,),),
                  Text(widget.deaths, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),)
                  ],),
              )
            ],
            ) 
    
            ),
    );
  }
}