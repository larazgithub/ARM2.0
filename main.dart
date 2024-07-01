import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";

  var bgColor = Colors.blueAccent.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.indigo,

        title: Text('Your BMI - Basic'),

      ),
      body: Container(
        color: bgColor,
        child: Center(
            child: Container(

              width: 300,
              //color: Colors.cyanAccent.shade100, color will not fill the whole screen.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter Your Weight in Kg', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                    ),
                 SizedBox(height: 20),

                 TextField(
                   controller: ftController,
                   decoration: InputDecoration(
                     label: Text('Enter the height in Feets',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
                     prefixIcon: Icon(Icons.height)
                   ),
                   keyboardType: TextInputType.number,
                 ),

                  SizedBox(height: 20),

                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label:Text('Enter your height in Inches',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400) ),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation
                    var iWt = int.parse(wt); //converting String into integer.
                    var fWt = int.parse(ft);
                    var inchWt = int.parse(inch);

                    var tInch = (fWt*12) + inchWt;

                    var tCm = tInch*2.54 ;

                    var tM = tCm/100 ;

                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You're Overweight";
                      bgColor = Colors.deepOrange;
                    }
                    else if(bmi<18){
                      msg = "You're Underweight";
                      bgColor = Colors.amberAccent.shade100;
                    }
                    else {
                     msg = "   You're Healthy";
                     bgColor = Colors.amberAccent;
                    }

                    setState(() {
                      result = "Your BMI is: ${bmi.toStringAsFixed(2)} \n\n $msg" ;
                    });
                  }
                  else {
                    setState(() {
                      result = 'Please fill the required blanks';
                    });
                  }

                  }, child: Text('Calculate', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                  SizedBox(height: 20,),

                  Text(result, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          ),
      )
    );
  }
}
