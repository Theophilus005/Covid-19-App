import 'package:flutter/material.dart';


class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key, this.CountryName, this.Confirmed, this.Deaths, this.Recovered, this.Active, this.Flag
  }) : super(key: key);

  final String CountryName;
  final String Confirmed;
  final String Deaths;
  final String Recovered;
  final String Active;
  final String Flag;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        //boxShadow: BoxShadow(offset: Offset(2, 5), blurRadius: 3),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    ),
                    Text(
                      CountryName,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.network(Flag, width:100, height:100)
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
              margin: EdgeInsets.only(top:25),
              alignment: Alignment.centerLeft,
              height: 100,
              //color: Colors.red,
              padding: EdgeInsets.only(left:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Confirmed:  ", style: TextStyle(color:Colors.orange[800], fontSize: 17),),
                      Text(Confirmed, style: TextStyle(color:Colors.orange[800], fontSize: 17),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Deaths:  ", style: TextStyle(color:Colors.red, fontSize: 17),),
                      Text(Deaths, style: TextStyle(color:Colors.red, fontSize: 17),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Recovered:  ", style: TextStyle(color:Colors.green, fontSize: 17),),
                      Text(Recovered, style: TextStyle(color:Colors.green, fontSize: 17),),
                    ],
                  ), 
                  Row(
                    children: <Widget>[
                      Text("Active:  ", style: TextStyle(color:Colors.blue, fontSize: 17),),
                      Text(Active, style: TextStyle(color:Colors.blue, fontSize: 17),),
                    ],
                  ), 

                ],
                
              ),
            ),
          ),
    
        ],
      ),
    );
  }
}
