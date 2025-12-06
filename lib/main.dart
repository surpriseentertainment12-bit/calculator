import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
      } else if (value == "=") {
        try {
          output = _calculate(output);
        } catch (_) {
          output = "Error";
        }
      } else {
        if (output == "0") output = "";
        output += value;
      }
    });
  }

  String _calculate(String expr) {
    try {
      final result = double.parse(expr);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget button(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 28)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(output, style: TextStyle(fontSize: 40)),
            ),
          ),
          Row(children: [button("7"), button("8"), button("9")]),
          Row(children: [button("4"), button("5"), button("6")]),
          Row(children: [button("1"), button("2"), button("3")]),
          Row(children: [button("0"), button("C"), button("=")]),
        ],
      ),
    );
  }
}
