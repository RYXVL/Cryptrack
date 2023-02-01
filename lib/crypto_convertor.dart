import 'package:cryptrack/crypto_convertor.dart';
import 'package:flutter/material.dart';
import 'crypto_data_getter.dart';


class CryptoConvertor extends StatefulWidget {
  CryptoConvertor(this.list);
  List<double> list;
  @override
  State<CryptoConvertor> createState() => _CryptoConvertorState();
}

class _CryptoConvertorState extends State<CryptoConvertor> {
  List<DropdownMenuItem> list = [
    DropdownMenuItem(
      child: Text('BTC'),
      value: 'BTC',
    ),
    DropdownMenuItem(
      child: Text('ETH'),
      value: 'ETH',
    ),
    DropdownMenuItem(
      child: Text('USDT'),
      value: 'USDT',
    ),
    DropdownMenuItem(
      child: Text('BUSD'),
      value: 'BUSD',
    ),
    DropdownMenuItem(
      child: Text('ADA'),
      value: 'ADA',
    ),
    DropdownMenuItem(
      child: Text('DOGE'),
      value: 'DOGE',
    ),
    DropdownMenuItem(
      child: Text('SOL'),
      value: 'SOL',
    ),
    DropdownMenuItem(
      child: Text('MATIC'),
      value: 'MATIC',
    ),
    DropdownMenuItem(
      child: Text('DOT'),
      value: 'DOT',
    ),
  ];
  String cryptoLeft = 'BTC';
  String cryptoRight = 'BTC';
  double question = 0;
  double answer = 0;

  // @override
  void initState() {
    super.initState();
    // allValueList = widget.list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        leading: TextButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   'data',
              //   style: TextStyle(fontSize: 100.0),
              // ),
              Expanded(
                // width: 150.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (newValue) {
                      question = double.parse(newValue);
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${question.toStringAsFixed(5)}',
                    ),
                  ),
                ),
              ),
              Expanded(
                // width: 150.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,),
                      ),
                      border: OutlineInputBorder(),
                      labelText: '${answer.toStringAsFixed(5)}',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              // TextField(decoration: InputDecoration(hintText: 'Hello', focusColor: Colors.grey),),
              // TextField(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: list,
                  onChanged: (value) {
                    setState(() {
                      cryptoLeft = value;
                    });
                  },
                  value: cryptoLeft,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: list,
                  onChanged: (value) {
                    setState(() {
                      cryptoRight = value;
                    });
                  },
                  value: cryptoRight,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              double x = widget.list[Crypto.list.indexOf('$cryptoLeft')];
              double y = widget.list[Crypto.list.indexOf('$cryptoRight')];
              setState(() {
                answer = question * x / y;
              });
              // print('$x | $y');
              // print('$question');
            },
            child: Text('Calculate'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
            ),
          ),
        ],
      ),
    );
  }
}