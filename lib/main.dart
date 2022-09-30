
import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator_button.dart';
import 'package:flutter_calculator/constants/colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
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
   late int firstNum;
   late int secondNum;
   String history='';
   String textToDisplay='';
   late String res;
   late String operation;
 void btnOnClick(String btnVal) {
   print(btnVal);
   if(btnVal=='C'){
     textToDisplay='';
     firstNum=0;
     secondNum=0;
     res='';
   }
   else if(btnVal=='AC'){
     textToDisplay='';
     firstNum=0;
     secondNum=0;
     res='';
     history='';
   }
   else if(btnVal=='+/-'){
     if(textToDisplay[0]!='-'){
       res='-'+ textToDisplay;
     }
     else{
       res=textToDisplay.substring(1);
     }
   }
   else if(btnVal=='<'){
     res=textToDisplay.substring(0,textToDisplay.length-1);
   }
   else if(btnVal=='+'||
       btnVal=='-'||
       btnVal=='X'||
       btnVal=='/'){
       firstNum=int.parse(textToDisplay);
       res='';
       operation=btnVal;
   }
   else if(btnVal=='='){
     secondNum=int.parse(textToDisplay);
     if(operation=='+'){
       res=(firstNum+secondNum).toString();
       history=firstNum.toString()+operation.toString()+secondNum.toString();
     }
     if(operation=='-'){
       res=(firstNum-secondNum).toString();
       history=firstNum.toString()+operation.toString()+secondNum.toString();
     }
     if(operation=='X'){
       res=(firstNum*secondNum).toString();
       history=firstNum.toString()+operation.toString()+secondNum.toString();
     }
     if(operation=='/'){
       res=(firstNum/secondNum).toString();
       history=firstNum.toString()+operation.toString()+secondNum.toString();
     }
   }
   else{
     res=int.parse(textToDisplay+btnVal).toString();
   }
   setState(() {
     textToDisplay=res;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text(widget.title),
      ),
      backgroundColor:Colors.lightBlue[900] ,
      body: Center(

        child: Column(
          mainAxisAlignment:MainAxisAlignment.end ,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child:Text(
                  history,
                  style:TextStyle(
                    fontSize: 24,
                    color:Colors.grey,
                  ),
                ),
              ),
              alignment:Alignment(1.0,1.0) ,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child:Text(
                  textToDisplay,
                  style:TextStyle(
                    fontSize: 40,
                    color:Colors.white,
                  ),
                ),

              ),
              alignment:Alignment(1.0,1.0) ,
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text:'AC',
                fillcolor:blue, 
                callback: btnOnClick,

              ),
              CalculatorButton(
                text:'C',
                fillcolor:blue,
                callback: btnOnClick,

              ),
              CalculatorButton(
                text:'<',
                fillcolor:yellow,
                callback: btnOnClick,

              ),
              CalculatorButton(
                text:'/',
                fillcolor:yellow,
                callback: btnOnClick,

              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text:'9',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'8',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'7',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'X',
                  fillcolor:yellow,
                  callback: btnOnClick,

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text:'6',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'5',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'4',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'-',
                  fillcolor:yellow,
                  callback: btnOnClick,

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text:'3',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'2',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'1',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'+',
                  fillcolor:yellow,
                  callback: btnOnClick,

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text:'+/-',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'0',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'00',
                  fillcolor:blue,
                  callback: btnOnClick,

                ),
                CalculatorButton(
                  text:'=',
                  fillcolor:yellow,
                  callback: btnOnClick,

                ),
              ],
            ),
        ],
        ),
      ),
    );
  }
}