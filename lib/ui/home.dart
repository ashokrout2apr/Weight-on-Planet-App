import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue= value;

      switch(radioValue){
        case 0:
          _finalResult= calculateWeight( _weightController.text, 0.06);
          _formattedText="Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult= calculateWeight( _weightController.text, 0.38);
          _formattedText="Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult= calculateWeight( _weightController.text, 0.91);
          _formattedText="Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("WEIGHT ON PLANET X"),
          centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset('images/planet.png',
              height: 133.0,
              width: 133.0,),


            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                      keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Enter your Weight",
                      hintText: "in pounds",
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Radio buttons
                      new Radio<int>(
                        activeColor: Colors.brown,
                          value:0 , groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("PLUTO",
                      style: new TextStyle(
                          color: Colors.white30 )),

                      new Radio<int>(
                        activeColor: Colors.red,
                      value:1 , groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("MARS",
                          style: new TextStyle(
                              color: Colors.white30 )),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                      value:2 , groupValue: radioValue, onChanged: handleRadioValueChanged),

                      new Text("VENUS",
                      style: new TextStyle(
                          color: Colors.white30 ),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  //Result Text
                    new Text(
                      _weightController.text.isEmpty ? "Please Enter Weight": _formattedText+"lbs",
//                  new Text("$_formattedText lbs",
                    style: new TextStyle(color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else {
      print("WRONG!");
      return int.parse("180") * 0.38;
    }
  }

}
//WEIGHT ON OTHER PLANETS-
//Mercury: 0.38
//Venus: 0.91
//Earth: 1.00
//Mars: 0.38
//Jupiter: 2.34
//Saturn: 1.06
//Uranus: 0.92
//Neptune: 1.19
//Pluto: 0.06
// WEIGHT= WEIGHT(on earth) * MULTIPLIER