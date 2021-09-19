import 'package:flutter/material.dart';
import './CountryCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {

  List generalData;

    Future fetchDataGeneral() async {
    http.Response response;
    response = await http.get("https://corona.lmao.ninja/v2/countries?yesterday=true&sort");
    if(response.statusCode == 200) {
    setState(() {
      generalData = json.decode(response.body);
    });
    }
  }

   //generalData == null ? :

  @override
  void initState() {
    fetchDataGeneral();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          "CASES AROUND THE WORLD",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: generalData == null ? Center(child:CircularProgressIndicator(),): ListView.builder(itemBuilder: (context, index) {
          return
            Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              margin: EdgeInsets.only(bottom:12),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: CountryCard(
              CountryName: generalData[index]["country"],
              Confirmed: generalData[index]["cases"].toString(),
              Deaths: generalData[index]["deaths"].toString(),
              Recovered: generalData[index]["recovered"].toString(),
              Active: generalData[index]["active"].toString(),
              Flag: generalData[index]["countryInfo"]["flag"]
          ),
            );
      } )
          

      
    );
  }
}
