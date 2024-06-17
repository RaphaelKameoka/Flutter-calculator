import 'package:calculator/controller/calculate.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorScreenState();
  }
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<String> buttons = [
    "C", "CE", "%", "/",
    "7", "8", "9", "x",
    "4", "5", "6", "",
    "1", "2", "3", "+",
    "+/-", "0", ".","=",
  ];

  String visorString = '';
  final Calculate calc = Calculate();

  void updateVisor() {
    setState(() {
      visorString = calc.input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.onTertiaryFixedVariant,
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
           Container(
             margin: const EdgeInsets.symmetric(horizontal: 12.0),
             decoration: BoxDecoration(
               borderRadius: const BorderRadius.all(Radius.circular(20.0)),
               color: kColorScheme.secondaryFixed
             ),
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                  alignment: Alignment.topRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        visorString,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 50.0),
                      ),
                    )

            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        switch (buttons[index]) {
                          case 'C':
                            calc.cPressed();
                            updateVisor();
                            break;
                          case 'CE':
                            calc.cePressed();
                            updateVisor();
                            break;
                          case '=':
                            calc.equalPressed();
                            updateVisor();
                            break;
                          case '.':
                            if (calc.input.substring(
                                    calc.input.length - 1, calc.input.length) !=
                                '.') {
                              calc.inputPressed(buttons[index]);
                              updateVisor();
                            }
                          case '+/-':
                            calc.plusMinusPressed();
                            updateVisor();
                          default:
                            calc.inputPressed(buttons[index]);
                            updateVisor();
                        }
                      },
                      child: Text(
                        buttons[index],
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22.0),
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ));
  }
}
