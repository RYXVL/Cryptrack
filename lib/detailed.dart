import 'dart:ffi';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'currencies.dart';
import 'dart:convert';

const apikey = '8FF9D1ED-7BDD-4788-AEF9-27A7E4669027';
// const apikey = '052BDA3D-3C66-45B1-B9DC-14129FADDEC7';
// const apikey = 'A648DFE7-A350-4ECE-8AEC-8F6E9C87549C';

class Detailed extends StatefulWidget {
  Detailed(this.cryptoName, this.cryptoAbbreviation, this.value);

  String cryptoName;
  String cryptoAbbreviation;
  double value;

  @override
  State<Detailed> createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  String curr = 'USD';
  List<DropdownMenuItem> list = [];
  late String cryptoName;
  late String cryptoAbbreviation;
  late double cryptoValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cryptoName =widget.cryptoName;
    cryptoAbbreviation = widget.cryptoAbbreviation;
    cryptoValue = widget.value;
    Currencies currencies = Currencies();
    for (int i = 0; i < currencies.currencyList.length; i++) {
      list.add(DropdownMenuItem(child: Text('${currencies.currencyList[i]}'), value: currencies.currencyList[i],),);
    }
  }

  Future<double> updateDetails() async {
    // print('before');
    Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$cryptoAbbreviation/$curr?apikey=$apikey'));
    // print(response.body);
    var decodedData = jsonDecode(response.body);
    return decodedData['rate'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'images/${cryptoAbbreviation.toLowerCase()}.png',
              height: 100.0,
              width: 100.0,
            ),
            Text('Name: ${cryptoName}'),
            Text('Code: ${cryptoAbbreviation}'),
            Text('Value: ${cryptoValue.toStringAsFixed(5)} $curr'),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                items: list,
                onChanged: (value) async {
                  setState(() {
                    curr = value;
                  });
                  double temp = await updateDetails();
                  setState(() {
                    print('$temp');
                    cryptoValue = temp;
                  });
                },
                value: curr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
