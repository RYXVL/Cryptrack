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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD2AE6D),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: DropdownButtonHideUnderline(
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: DropdownButtonHideUnderline(
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
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0),),
              color: Color(0xffD2AE6D),
            ),
            height: 75.0,
            width: 300.0,
            child: TextButton(
              onPressed: () {
                double x = widget.list[Crypto.list.indexOf('$cryptoLeft')];
                double y = widget.list[Crypto.list.indexOf('$cryptoRight')];
                setState(() {
                  answer = question * x / y;
                });
              },
              child: Text('Calculate', style: TextStyle(color: Colors.white, fontSize: 30.0,),),
            ),
          ),
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/phoenix.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}