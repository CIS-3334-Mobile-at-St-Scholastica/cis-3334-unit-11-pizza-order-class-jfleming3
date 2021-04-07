
import 'package:flutter/material.dart';

import 'pizza.dart';

class addPizzaDialog1 extends StatefulWidget {


  @override
  _addPizzaDialog1State createState() => _addPizzaDialog1State();
}

class _addPizzaDialog1State extends State<addPizzaDialog1> {
  final pizzaToppingTextField = TextEditingController();
  int _sizeSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          height: 200,
          child:  Column(
            children: <Widget>[
              Text(
                'Toppings:',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                controller: pizzaToppingTextField,
                style: Theme.of(context).textTheme.headline4,
              ),
              DropdownButton(
                  style: Theme.of(context).textTheme.headline4,
                  value: _sizeSelected,
                  items:[
                    DropdownMenuItem(child: Text("Small"), value: 0),
                    DropdownMenuItem(child: Text("Medium"), value: 1),
                    DropdownMenuItem(child: Text("Large"), value: 2),
                    DropdownMenuItem(child: Text("X-Lareg"), value: 3)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _sizeSelected = value;
                    });
                  }),
              ElevatedButton(
                child: Text('Add Pizza'),
                onPressed: () {
                  print("Adding a pizza");
                  setState(() {
                    Pizza newPizza = new Pizza(pizzaToppingTextField.text, _sizeSelected);
                    pizzasInOrder.add(newPizza);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        )
    );
  }
}