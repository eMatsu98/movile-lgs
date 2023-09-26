import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:counter_provider/providers/tip_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TipProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? selectedOption;

  @override
  Widget build(BuildContext context) {
    final tipProvider = Provider.of<TipProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tip Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.room_service,
                  color: Colors.grey,
                ),
                SizedBox(width: 20.0),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final cost = double.tryParse(value) ?? 0.0;
                      tipProvider.updateCostOfService(cost);
                    },
                    decoration: InputDecoration(
                      labelText: 'Cost of service',
                      hintText: 'Enter cost',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.rate_review,
                  color: Colors.grey,
                ),
                SizedBox(width: 20.0),
                Text(
                  'How was the service?',
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Radio<int>(
                    value: 20,
                    groupValue: selectedOption != null && selectedOption == 20 ? 20 : 0,
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = 20.0;
                      });
                    },
                  ),
                  title: Text('Amazing 20%'),
                ),
                ListTile(
                  leading: Radio<int>(
                    value: 18,
                    groupValue: selectedOption != null && selectedOption == 18 ? 18 : 0,
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = 18.0;
                      });
                    },
                  ),
                  title: Text('Good 18%'),
                ),
                ListTile(
                  leading: Radio<int>(
                    value: 15,
                    groupValue: selectedOption != null && selectedOption == 15 ? 15 : 0,
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = 15.0;
                      });
                    },
                  ),
                  title: Text('Okay 15%'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Round up tip',
                        ),
                      ],
                    ),
                  ),
                ),
                Switch(
                  value: tipProvider.roundUpTip,
                  onChanged: (bool value) {
                    tipProvider.updateRoundUpTip(value);
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            
            // Botón de CALCULATE
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para calcular el tip y actualizar el texto de abajo
                      if (selectedOption != null) {
                        tipProvider.updateSelectedOption(selectedOption!);
                        tipProvider.calculateTip();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedOption != null ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Text('CALCULATE'),
                  ),
                ),
              ],
            ),
            
            // Texto de abajo
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Tip amount: \$${tipProvider.totalTip.toStringAsFixed(2)}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
