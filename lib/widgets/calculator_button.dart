import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants/colors.dart';
class CalculatorButton extends StatelessWidget{
  final String text;
  final Color fillcolor;
  final Function callback;

  const CalculatorButton({
     required this.text,
    required this.fillcolor,
    required this.callback,
});

  @override
   Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ElevatedButton(
          child: Text(text,),
          onPressed: () => callback(text),
          style: ElevatedButton.styleFrom(
              primary: fillcolor,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              textStyle: const TextStyle(
                  fontSize: 28,

                  fontWeight: FontWeight.bold,
              )
          ),
        ),
      );
}
}