import 'package:covid/pages/MostAffected.dart';
import 'package:covid/pages/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './faqs.dart';
import './GhanaStat.dart';
import './Countries.dart';
import './measures.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

double xOffset = 0;
double yOffset = 0;
double scalefactor = 1;
bool draweropen = false;


class _HomeScreenState extends State<HomeScreen> {

   List generalData;
   Map ghanaData;

  Future fetchDataGhana() async {
    http.Response response;
    response = await http.get("https://corona.lmao.ninja/v2/countries/ghana?yesterday=true&sort=cases");
    if(response.statusCode == 200) {
    setState(() {
      ghanaData = json.decode(response.body);
    });
    }
  }


@override
  void initState() {
    fetchDataGhana();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text("COVID 19 STATISTICS", style: TextStyle(fontSize: 16)),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[500],
          child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon:Icon(Icons.close, size: 30, color: Colors.white),
                        onPressed: () {Navigator.pop(context);}
                        )
                      
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                  padding: EdgeInsets.only(bottom:80),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                         GestureDetector(
                           onTap: () {
                             Navigator.pop(context);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => MostAffected()),);},
                            child: Container(
                            height:50,
                            //color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Icon(Icons.map, color: Colors.white)),
                                SizedBox(
                                  width: 6,
                                ),
                                
                                      
                                      Text("Most Affected Countries",
                                      style: TextStyle(color: Colors.white),),
                                
                              ],
                            ),
                        ),
                         ),
                      
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Symptoms()));
                          
                          },
                          child: Container(
                          margin: EdgeInsets.only(
                            top: 45,
                            left: 10,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.local_hospital,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Symptoms", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Measures()));},
                                            child: Container(
                          margin: EdgeInsets.only(
                            top: 45,
                            left: 10,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.warning, color: Colors.white),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Preventive Measures",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()),);
                    
                      },
                          child: Container(
                          margin: EdgeInsets.only(
                            top: 45,
                            left: 10,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.history, color: Colors.white),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Frequently Asked Questions", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                                              child: Container(
                                                height:100,
                          margin: EdgeInsets.only(
                            top: 45,
                            left: 10,
                          ),
                          child: Row(
                            children: <Widget>[
                              //Icon(Icons.call, color: Colors.white),
                              SizedBox(
                                width: 6,
                              ),
                              //Text("Emergency Numbers",
                                //  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  
                  SizedBox(width: 8),
                  Icon(Icons.copyright, color: Colors.white),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Theophilus Addo 2020",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
      ),
        ),
         ),
      backgroundColor: Colors.grey[50],
      body: 
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [        
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                        ),
                        //margin: EdgeInsets.only(top:20),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                          ),
                          
                          child: Image.asset(
                            "assets/images/black-doctor.png",
                            fit: BoxFit.cover,
                            //alignment: Alignment.bottomCenter,
                    
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        //margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width:10),
                            ghanaData==null? CircularProgressIndicator(): 
                            Image.network(ghanaData["countryInfo"]["flag"].toString(), width:40),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "GHANA",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Countries(),),);},
                                child: Container(
                                width: 120,
                                height: 35,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text("Global Cases",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                       ghanaData == null ? Container(
                         width:double.infinity,
                         height:400,
                         color: Colors.blue[50],
                         child: Center(child: CircularProgressIndicator())):
                      Container(
                        height: 500,
                        width: double.infinity,
                        padding: EdgeInsets.only(top:10),
                        decoration: BoxDecoration(color: Colors.blue[50]),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:10),
                            Container(
                              //padding: EdgeInsets.only(bottom:30, top:10),
                              height:50,
                              width: MediaQuery.of(context).size.width/2.5,
                              decoration: BoxDecoration(color:Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: 
                             
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                    SvgPicture.asset("assets/images/syringe.svg", width: 20,),
                                    Text("Tests", style: TextStyle(fontSize:20, color:Colors.green[500]),)
                                  ],),
                                  
                                  Text(ghanaData["tests"].toString(), style: TextStyle(fontSize:16, color: Colors.grey[500]),)
                                ],),
                              )
                            ),
                            SizedBox(height:10),
                            
                            Row(
                              children: <Widget>[
                                
                                GhanaStat(Colors.orange, "CONFIRMED", ghanaData["cases"].toString()),
                               
                                GhanaStat(Colors.red, "DEATHS", ghanaData["deaths"].toString())
                              ],
                            ),
                            
                            Row(
                              children: <Widget>[
                                
                                GhanaStat(Colors.blue, "ACTIVE", ghanaData["active"].toString()),
                              
                                GhanaStat(Colors.green, "RECOVERED", ghanaData["recovered"].toString()),
                              ],
                            ),
                            SizedBox(height:10),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height:70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Expanded(child:Container(
                                      height:3,
                                      color:Colors.white,
                                    ),),
                                    Text("CRITICAL", style: TextStyle(color:Colors.white, fontSize: 18),),
                                    Expanded(child:Container(
                                      height:3,
                                      color:Colors.white,
                                    ),),
                                  ],),
                                  
                                  Text(ghanaData["critical"].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:35)),

                                  
                                ],
                              )
                              
                            ),
                            SizedBox(height:20),
                            Text("WE ARE IN THE FIGHT TOGETHER", style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize:18, shadows: [BoxShadow(blurRadius: 20, color:Colors.blue[500])]))
                          ],
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
  }
}
