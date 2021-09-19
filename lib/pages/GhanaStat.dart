import 'package:flutter/material.dart';

class GhanaStat extends StatelessWidget {

  final Color indicator;
  final String status;
  final String number;

  GhanaStat(this.indicator, this.status, this.number); 

  @override
  Widget build(BuildContext context) {
        return  Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 100,
              width:MediaQuery.of(context).size.width/2.3,
              decoration: BoxDecoration(color:Colors.white, 
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[ 
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(color:indicator,
                    shape: BoxShape.circle),
                  ),
                  Text(status, style: TextStyle(fontSize: 16,)),
                  ],),
                  Text(number, style: TextStyle(fontSize: 25)),
                ],
              )
            );
  }
}
  

