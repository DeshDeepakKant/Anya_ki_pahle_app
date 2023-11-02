import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/ui_helper/util.dart';
import 'package:untitled3/widgets/rounded_btn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var ccc = Colors.red.shade500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI App'),
        ),
        body: Container(
          // color: Colors.lightBlue,
          color: ccc,
          child: Center(
            child: Container(
              width: 250,
              // height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: 22,
                  // ),
                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  // SizedBox(
                  //   height: 22,
                  // ),
                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                      label: Text('Enter your height'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  // SizedBox(
                  //   height: 22,
                  // ),
                  TextField(
                    controller: incontroller,
                    decoration: InputDecoration(
                      // hintText: 'Username',
                      label: Text('Enter'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  // SizedBox(
                  //   height: 22,
                  // ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inches = incontroller.text.toString();
                        if ((wt != "") && (ft != "") && (inches != "")) {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinches = int.parse(inches);
                          var tinches = (12 * ift) + iinches;
                          var tcm = tinches * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are overweight";
                            ccc = Colors.deepOrange;
                          } else if (bmi < 18) {
                            msg = "You are underweight";
                            ccc = Colors.grey;
                          } else {
                            msg = "You are healthy";
                            ccc = Colors.lightGreen;
                          }
                          setState(() {
                            result =
                                "$msg \n Your BMI is ${bmi.toStringAsFixed(5)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all values";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  // SizedBox(
                  //   height: 22,
                  // ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
