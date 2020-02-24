import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMI();
  }
}

//(Weight (lbs.) * 703) / Height (inches)2

//Below 18.5	Underweight
//18.5-24.9	Healthy
//25.0-29.9	Overweight
//30.0 and above	Obese

class BMI extends State<Home> {
  final TextEditingController _heightHandler = new TextEditingController();
  final TextEditingController _weightHandler = new TextEditingController();
  final TextEditingController _ageHandler = new TextEditingController();
  double inches = 0.0;
  double bmi = 0.0;
  String message ="";

  void calculateBMI(){
    setState(() {
      int age = int.parse(_ageHandler.text);
      double height = double.parse(_heightHandler.text);
      double weight = double.parse(_weightHandler.text);
      inches =  height *12;
      if(_ageHandler.text.isNotEmpty || age > 0
      && _heightHandler.text.isNotEmpty || inches > 0
          && _weightHandler.text.isNotEmpty || weight > 0){
       bmi = weight / (inches * inches) * 703;

       if(double.parse(bmi.toStringAsFixed(1)) < 18.5 ){message = "Underweight";}
       else if(double.parse(bmi.toStringAsFixed(1)) < 25.0){message = "Healthy";}
       else if(double.parse(bmi.toStringAsFixed(1)) <= 30.0){message = "Overweight";}
       else {message = "Obese";}

      }else
        { bmi = 0.0;}
    });


  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 90.0,
              width: 180.0,
            ),
            new Container(
              alignment: Alignment.center,
              height: 275.0,
              padding: new EdgeInsets.all(10.0),
              color: Colors.grey.shade200,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _ageHandler,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.watch_later),
                      labelText: "Age",
                      hintText: "Age",
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightHandler,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.straighten),
                      labelText: "Height in ft",
                      hintText: "Height in ft",
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightHandler,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.vertical_align_bottom),
                      labelText: "Weight in lb",
                      hintText: "Weight in lb",
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new RaisedButton(
                    onPressed: calculateBMI,
                    color: Colors.pinkAccent,
                    child: new Text(
                      "Calculate",
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(
                  "Your BMI is ${bmi.toStringAsFixed(1)}",
                  style: new TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(
                  "You are $message",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
