import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text("Symptoms"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SymptomsCard(
                  heading: "COUGH",
                  description:
                      "One of the signs of Covid 19 is persistent cough, victims tend to cough profusely",
                  imagepath: "assets/images/cough.svg",
                ),
                SymptomsCard(
                    heading: "RUNNING NOSE",
                    description:
                        "Victims tend have cold and sneeze a lot, which results in a running nose",
                    imagepath: "assets/images/sneeze.svg"),
                SymptomsCard(
                    heading: "SORE THROAT",
                    description:
                        "Victims feel sudden pain and itching in their pharynx",
                    imagepath: "assets/images/sore throat.svg"),
                SymptomsCard(
                    heading: "FEVER",
                    description:
                        "Victims normally exhibit symptoms of fever and high body temperatures",
                    imagepath: "assets/images/high temperature.svg"),
                SymptomsCard(
                    heading: "FATIQUE",
                    description:
                        "Victims get tired on the least thing they do, their energy level reduces",
                    imagepath: "assets/images/tired.svg"),
              ],
            ),
          ),
        ));
  }
}

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({Key key, this.heading, this.description, this.imagepath})
      : super(key: key);

  final String heading;
  final String description;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(children: [
        Container(
            child: Container(
              margin: EdgeInsets.only(left: 180),
              width: double.infinity,
              //color: Colors.red,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(heading,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Text(description, style: TextStyle(color: Colors.grey)),
                  ]),
            ),
            margin: EdgeInsets.only(top: 20),
            height: 150,
            width: double.infinity,
            color: Colors.white),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 170,
          width: 170,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.white),
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(imagepath, fit: BoxFit.contain),
        )
      ]),
    );
  }
}
