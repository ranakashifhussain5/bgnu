import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController numController = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String selectedOperation = 'Add'; // Default operation
  double result = 0; // Store the calculated result

  void calculateResult() {
    double num1 = double.tryParse(numController.text) ?? 0; // Convert text to number
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      if (selectedOperation == 'Add') {
        result = num1 + num2;
      } else if (selectedOperation == 'Subtract') {
        result = num1 - num2;
      } else if (selectedOperation == 'Multiply') {
        result = num1 * num2;
      } else if (selectedOperation == 'Divide') {
        result = num2 != 0 ? num1 / num2 : 0; // Avoid division by zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Value 1'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Value 2'),
              ),
              SizedBox(height: 20),

              // Dropdown for selecting operation
              DropdownButton<String>(
                value: selectedOperation,
              //  items: ['Add', 'Subtract', 'Multiply', 'Divide'],
                items: [
                  DropdownMenuItem(value:'Add',child:Text('Add')),
                  DropdownMenuItem(value:'Subtract',child:Text('Subtract')),
                  DropdownMenuItem(value:'Multiply',child:Text('Multiply')),
                  DropdownMenuItem(value:'Divide',child:Text('Divide')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOperation = newValue!;
                  });
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateResult,
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),

              // Display result

            ],
          ),
        ),
      ),
    );
  }
}
