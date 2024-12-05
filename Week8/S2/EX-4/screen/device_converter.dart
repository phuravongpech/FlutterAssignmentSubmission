import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Currency { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {

 
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  
  Currency dropDownCurrency = Currency.riels;
  final TextEditingController _amountMoney = TextEditingController();
  double exchangeValue = 0;

  @override
  void initState() {
    super.initState();
    _amountMoney.addListener(_onAmountChanged);
  }

  @override 
  void dispose(){
    _amountMoney.removeListener(_onAmountChanged);
    _amountMoney.dispose();
    super.dispose();
  }

  void _onAmountChanged() {
    exchangeCurrency();
  }
  
  DropdownButton<Currency> currencyDropDown(){
    return DropdownButton<Currency>(
      value: dropDownCurrency,
      onChanged: (Currency? newValue){
        setState(() {
          dropDownCurrency = newValue!;
          exchangeCurrency();
        });
      },
      items: Currency.values.map<DropdownMenuItem<Currency>>((Currency value){
        return DropdownMenuItem(
          value:value,
          child: Text(value.toString().split('.').last));
      }).toList(),
      );
  }

  void exchangeCurrency(){
    setState(() {
    double amount = double.tryParse(_amountMoney.text) ?? 0;
    switch (dropDownCurrency) {
      case Currency.riels:
        exchangeValue = amount * 4150;
        break;
      case Currency.euro:
        exchangeValue = amount * 0.95;
        break;
      case Currency.dong:
        exchangeValue = amount * 25000;
        break;
    } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),

          TextField(
            controller: _amountMoney,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
              ),
          const SizedBox(height: 30),
            currencyDropDown(),


          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                exchangeValue.toStringAsFixed(2),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
              )
        ],
      )),
    );
  }
}