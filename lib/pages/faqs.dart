import 'package:flutter/material.dart';
import './data.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(title: Text("FAQ's")),
      body: ListView.builder(itemCount: Whodata.faq.length,itemBuilder: (context, index) {
        return Container(

          margin: EdgeInsets.only(bottom:0),
        color: Colors.white,
        child: ExpansionTile(
          title: Text(Whodata.faq[index]['question'], style: TextStyle(color: Colors.blue)),
          children: <Widget>[Container(
            margin: EdgeInsets.symmetric(horizontal:15),
            child: Text(Whodata.faq[index]['answer'], style: TextStyle(color: Colors.black45)))],
        ),
        );
      },)
    );
  }
}