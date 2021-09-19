import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Measures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preventive Measures"), backgroundColor: Colors.blue[400],),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
              child: Container(
                margin:EdgeInsets.only(top:10),
          child: Column(
            children: <Widget>[
              LeftStack(titleL: "Wear Nose Masks", descriptionL: "Masks reduces the chances of the virus getting in touch with your nose and mouth", pathL: "assets/images/mask.svg",),

              RightStack(titleR: "Use Hand Sanitizers", descriptionR: "Hand Sanitizers cleanses the hands of germs and kills the virus if present", pathR: "assets/images/sanitizer.png",),
            
              LeftStack(titleL: "Avoid Handshakes", descriptionL: "Unnecessary handshakes transmits the virus from infected persons to uninfected persons", pathL: "assets/images/handshake.svg",),    
            
              RightStack(titleR: "Washing Hands Regulary", descriptionR: "Regular washing of the hands with soap and water kills easily kills the virus when present", pathR: "assets/images/washing hands.png",),
            
              LeftStack(titleL: "Avoid Travels", descriptionL: "Travelling from one place to other makes one vulnerable to the virus.", pathL: "assets/images/no flight.svg",),
            ],
          ),
        ),
      )
    );
  }
}

class RightStack extends StatelessWidget {
  const RightStack({
    Key key, this.titleR, this.descriptionR, this.pathR
  }) : super(key: key);

  final String titleR;
  final String descriptionR;
  final String pathR;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom:10),
      child: Stack(
        children: [ Container(
        margin:EdgeInsets.only(top:20),
        height: 120,
        width: double.infinity,
        color: Colors.white,
             
            child: Align(
              alignment: Alignment.centerLeft,
                                      child: Container(
              margin: EdgeInsets.only(left:0),
              //color:Colors.yellow,
              width:150,
              height: 120,
              child: Align(
                    alignment: Alignment.center,
                    child: Container(
                    //color:Colors.blue,
                    width: double.infinity,
                    height:120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text(titleR, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                  ),),),
                          
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(descriptionR, style: TextStyle(color: Colors.black54)
                                  
                                ),
                              ),
                      ],
                    ),
                  ),
              
              //padding: EdgeInsets.only(left:170),
          ),
               
                                ),
            ),
        ),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
      margin: EdgeInsets.only(top:10),
      width:170,
      height:140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius:10, color: Colors.white),]
      ),
      child: Image.asset(pathR, fit: BoxFit.contain,),
      ),
                )
        ],),
    );
  }
}

class LeftStack extends StatelessWidget {
  const LeftStack({
    Key key, this.titleL, this.descriptionL, this.pathL
  }) : super(key: key);

  final String titleL;
  final String descriptionL;
  final String pathL;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: Stack(
              children: [ Container(
              margin:EdgeInsets.only(top:20),
              height: 120,
              width: double.infinity,
              color: Colors.white,
                   
                  child: Container(
                  margin: EdgeInsets.only(left:170),
                  //color:Colors.yellow,
                  width:double.infinity,
                  height: 120,
                  child: Align(
                        alignment: Alignment.center,
                        child: Container(
                        //color:Colors.blue,
                        width: double.infinity,
                        height:120,
                        child:Column(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Center(child: Text(titleL, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 16, 
                            ),),),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(descriptionL, style: TextStyle(color: Colors.black54)
                                
                              ),
                            ),],
                        )
                      ),
                  
                  //padding: EdgeInsets.only(left:170),
                ),
                   
                                    ),
              ),
        
        Container(
          margin: EdgeInsets.only(top:10),
          width:170,
          height:140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(pathL, fit: BoxFit.contain)
          )
              ],),
    );
  }
}