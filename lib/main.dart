import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
            child: const Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xff74ebd5), Color(0xff9face6)],
                center: Alignment.bottomLeft,
                stops: [0.0, 1.0])),
//color: bgcolor,
        child: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Weight"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Enter Your Height(in Feet)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text("'Enter Your height"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      // ignore: unused_local_variable
                      var inch = inchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //BMI cal
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (ift * 12) + iInch;
                        var tCm = tInch * 2.54;

                        var tM = tCm / 100;

                        var bmi = iwt / ((tM * tM));
                        // ignore: unused_local_variable
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are OverWeight!!";
                          bgcolor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are underweight!!";
                          bgcolor = Colors.red.shade200;
                        } else {
                          msg = "You are Healthy!!";
                          bgcolor = Colors.green.shade200;
                        }
                        setState(() {
                          result = "$msg \n  BMI is:${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill required blanks!!";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
