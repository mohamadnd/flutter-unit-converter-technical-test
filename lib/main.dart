import 'package:flutter/material.dart';

import 'Decoratedwidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter (technical test)',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

TextEditingController MyController = new TextEditingController();
double initialvalue = 0;
String selectedstart = "";
String selectedend = "";
int selectedindex = 0;
double result = 0.0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter (technical test)'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                height: 60,
                padding: EdgeInsets.all(5),
                child: Textbox(
                  "Please enter a value",
                  contorller: MyController,
                  onChanged: (a) {
                    if (MyController.text != "") {
                      if (selectedindex == 1)
                        setState(() {
                          calculate("Gram", " Kilogram", 1, double.parse(a));
                        });

                      if (selectedindex == 2)
                        setState(() {
                          calculate("Kilograms", " Pounds", 2, double.parse(a));
                        });

                      if (selectedindex == 3)
                        setState(() {
                          calculate(
                              "Centimeter", " Meters", 3, double.parse(a));
                        });

                      if (selectedindex == 4)
                        setState(() {
                          calculate(
                              "Centimeter", " Inches", 4, double.parse(a));
                        });
                    }
                  },
                )),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.purple, width: 1)),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        " Choose Conversion type",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  ButtonCnv(
                      "Gram To kilogram",
                      (selectedindex == 1) ? Colors.orange : Colors.purple,
                      1, ontap: () {
                    setState(() {
                      selectedindex = 1;
                      calculate("Gram", " Kilogram", 1,
                          double.parse(MyController.text));
                    });
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonCnv(
                      "Kilograms To Pounds",
                      (selectedindex == 2) ? Colors.orange : Colors.purple,
                      2, ontap: () {
                    setState(() {
                      selectedindex = 2;
                      calculate("Kilograms", " Pounds", 2,
                          double.parse(MyController.text));
                    });
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonCnv(
                      "Centimeters To Meters",
                      (selectedindex == 3) ? Colors.orange : Colors.purple,
                      3, ontap: () {
                    setState(() {
                      selectedindex = 3;
                      calculate("Centimeter", " Meters", 3,
                          double.parse(MyController.text));
                    });
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonCnv(
                      "Centimeter To Inches",
                      (selectedindex == 4) ? Colors.orange : Colors.purple,
                      4, ontap: () {
                    setState(() {
                      selectedindex = 4;
                      calculate("Centimeter", " Inches", 4,
                          double.parse(MyController.text));
                    });
                  }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Text(
              " Result",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            (selectedindex == 0)
                ? Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.purple, width: 1)),
                    child: Row())
                : Result(
                    initialvalue,
                    selectedstart,
                    result,
                    selectedend,
                  )
          ],
        ),
      ),
    );
  }
}

void calculate(
  String start,
  String end,
  int index,
  double value,
) {
  selectedindex = index;
  initialvalue = value;
  selectedstart = start;
  if (index == 1) result = value / 1000;
  if (index == 2) result = value * 2.20462;
  if (index == 3) result = value / 100;
  if (index == 4) result = value * 0.393700787;
  selectedend = end;
}
