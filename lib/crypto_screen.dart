import 'package:flutter/material.dart';
import 'crypto_container.dart';
import 'crypto_convertor.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'crypto_data_getter.dart';

class CryptoScreen extends StatefulWidget {
  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  List<double> list = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff7b7b85),
      // backgroundColor: Color(0xffbbbbc4),
      // backgroundColor: Color(0xffe4e2f2),
      // backgroundColor: Color(0xff585862),
      backgroundColor: Color(0xff3a3a45),
      body: !isLoading ?
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CryptoContainer('Bitcoin', 'BTC'),
                CryptoContainer('Ethereum', 'ETH'),
                CryptoContainer('Tether', 'USDT'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CryptoContainer('Binance USD', 'BUSD'),
                CryptoContainer('Cardano', 'ADA'),
                CryptoContainer('Dogecoin', 'DOGE'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CryptoContainer('Solana', 'SOL'),
                CryptoContainer('Polygon', 'MATIC'),
                CryptoContainer('Polkadot', 'DOT'),
              ],
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if(list.isEmpty)
                  list = await Crypto('BTC', 'USD').getAllData();
                setState(() {
                  isLoading = false;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) {return CryptoConvertor(list);}));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff7b7b85)),
              ),
              child: Text(
                'Crypto Convertor',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ) :
      Center(
      child: !isLoading ? null : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
            // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text('Setting up the conversion enviornment...'),
        ],
      )
    ),
    );
  }
}
