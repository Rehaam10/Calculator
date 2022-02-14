// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String res = ' ';
  String finalRes = ' ';
  double num1 = 0;
  double num2 = 0;
  String opr = '';

  void buttonClick(String buttonValue) {
    if (buttonValue == 'AC') {
      setState(() {
        finalRes = ' ';
        res = ' ';
      });
      num1 = 0;
      num2 = 0;
    } else if (buttonValue == 'C') {
      setState(() {
        finalRes = '';
      });
    }
    // history => res
    // exp = finalRes
    else if (buttonValue == '+' ||
        buttonValue == '-' ||
        buttonValue == 'X' ||
        buttonValue == '/' ||
        buttonValue == '%') {
      num1 = double.parse(finalRes);
      opr = buttonValue;
      setState(() {
        finalRes = '';
        res = num1.toString();
        res += buttonValue;
      });
    } else if (buttonValue == '.') {
      if (finalRes.contains('.')) {
      } else {
        finalRes += buttonValue;
      }
    } /*else if (buttonValue == '%') {
      num2 = double.parse(res);
      finalRes = (num2/100).toString();

    } */
    else if (buttonValue == '+/-') {
      if (res.toString().contains('-')) {
        res.toString().substring(1);
        finalRes = res;
      } else {
        res = '-' + res;
        finalRes = res;
      }
    } else if (buttonValue == '=') {
      num2 = double.parse(finalRes);
      res += finalRes;
      if (opr == '+') {
        finalRes = (num1 + num2).toString();
      }
      if (opr == '-') {
        finalRes = (num1 - num2).toString();
      }
      if (opr == 'X') {
        finalRes = (num1 * num2).toString();
      }
      if (opr == '%') {
        finalRes = (num1 % num2).toString();
      }
      if (opr == '/') {
        num2 == 0
            ? finalRes = 'syntax error'
            : finalRes = (num1 / num2).toString();
      }
    } else {
      setState(() {
        finalRes += buttonValue;
      });
    }

    setState(() {
      //res = double.parse(finalRes).toString();
    });
  }

  Widget defaultCalcButton({
    required String text,
    required Color buttonColor,
    Function? onPress,
    Function? onTap,
    required Function callBack,
    double? buttonWidth = 80,
    int buttonFlex = 1,
  }) =>
      Expanded(
        flex: buttonFlex,
        child: GestureDetector(
          onTap: () {
            callBack(text);
          },
          child: Container(
            width: buttonWidth,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: buttonColor,
            ),
            child: MaterialButton(
              onPressed: () {
                buttonClick(text);
              },
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 20.0,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                res,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.black,
              height: 1.0,
              thickness: 5.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20.0,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                finalRes,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                defaultCalcButton(
                    text: 'AC',
                    buttonColor: Colors.deepOrange,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: 'C',
                    buttonColor: Colors.green,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '%',
                    buttonColor: Colors.blueGrey,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '/',
                    buttonColor: Colors.pinkAccent,
                    callBack: buttonClick),
              ],
            ),
            /*
             Row(
              children: [
                defaultCalcButton(text: '√ ', buttonColor: Colors.deepOrange , callBack: buttonClick),
                defaultCalcButton(text: 'sin', buttonColor: Colors.green , callBack: buttonClick),
                defaultCalcButton(text: 'cos', buttonColor: Colors.blueGrey, callBack: buttonClick),
                defaultCalcButton(text: 'tan', buttonColor: Colors.pinkAccent, callBack: buttonClick),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(text: 'π', buttonColor: Colors.deepOrange , callBack: buttonClick),
                defaultCalcButton(text: 'e', buttonColor: Colors.green , callBack: buttonClick),
                defaultCalcButton(text: '+/-', buttonColor: Colors.blueGrey, callBack: buttonClick),
                defaultCalcButton(text: 'X!', buttonColor: Colors.pinkAccent, callBack: buttonClick),
              ],
            ),
              */
            Row(
              children: [
                defaultCalcButton(
                    text: '7',
                    buttonColor: Colors.deepOrange,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '8',
                    buttonColor: Colors.green,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '9',
                    buttonColor: Colors.blueGrey,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: 'X',
                    buttonColor: Colors.pinkAccent,
                    callBack: buttonClick),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(
                    text: '4',
                    buttonColor: Colors.deepOrange,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '5',
                    buttonColor: Colors.green,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '6',
                    buttonColor: Colors.blueGrey,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '-',
                    buttonColor: Colors.pinkAccent,
                    callBack: buttonClick),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(
                    text: '1',
                    buttonColor: Colors.deepOrange,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '2',
                    buttonColor: Colors.green,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '3',
                    buttonColor: Colors.blueGrey,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '+',
                    buttonColor: Colors.pinkAccent,
                    callBack: buttonClick),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(
                    text: '0',
                    buttonColor: Colors.deepOrange,
                    buttonFlex: 2,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '.',
                    buttonColor: Colors.green,
                    callBack: buttonClick),
                defaultCalcButton(
                    text: '=',
                    buttonColor: Colors.blueGrey,
                    callBack: buttonClick),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
 Row(
              children: [
                defaultCalcButton(text: 'AC', buttonColor: Colors.deepOrange , onPress: (){}),
                defaultCalcButton(text: 'C', buttonColor: Colors.green , onPress: (){}),
                defaultCalcButton(text: '%', buttonColor: Colors.blueGrey, onPress: (){}),
                defaultCalcButton(text: '/', buttonColor: Colors.pinkAccent, onPress: (){}),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(text: '7', buttonColor: Colors.deepOrange , onPress: (){}),
                defaultCalcButton(text: '8', buttonColor: Colors.green , onPress: (){}),
                defaultCalcButton(text: '9', buttonColor: Colors.blueGrey, onPress: (){}),
                defaultCalcButton(text: 'X', buttonColor: Colors.pinkAccent, onPress: (){}),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(text: '4', buttonColor: Colors.deepOrange , onPress: (){}),
                defaultCalcButton(text: '5', buttonColor: Colors.green , onPress: (){}),
                defaultCalcButton(text: '6', buttonColor: Colors.blueGrey, onPress: (){}),
                defaultCalcButton(text: '-', buttonColor: Colors.pinkAccent, onPress: (){}),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(text: '1', buttonColor: Colors.deepOrange , onPress: (){}),
                defaultCalcButton(text: '2', buttonColor: Colors.green , onPress: (){}),
                defaultCalcButton(text: '3', buttonColor: Colors.blueGrey, onPress: (){}),
                defaultCalcButton(text: '+', buttonColor: Colors.pinkAccent, onPress: (){}),
              ],
            ),
            Row(
              children: [
                defaultCalcButton(text: '0', buttonColor: Colors.deepOrange , onPress: (){}),
                defaultCalcButton(text: '.', buttonColor: Colors.green , onPress: (){}),
                defaultCalcButton(text: '=', buttonColor: Colors.blueGrey, onPress: (){}),
              ],
            ),
 */
