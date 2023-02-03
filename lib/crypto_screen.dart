import 'package:flutter/material.dart';
import 'crypto_container.dart';
import 'crypto_convertor.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'crypto_data_getter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'error_condn.dart';

class CryptoScreen extends StatefulWidget {
  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

List<CryptoContainer> omega = [
  CryptoContainer('Bitcoin', 'BTC'),
  CryptoContainer('Ethereum', 'ETH'),
  CryptoContainer('Tether', 'USDT'),
  CryptoContainer('Binance USD', 'BUSD'),
  CryptoContainer('Cardano', 'ADA'),
  CryptoContainer('Dogecoin', 'DOGE'),
  CryptoContainer('Solana', 'SOL'),
  CryptoContainer('Polygon', 'MATIC'),
  CryptoContainer('Polkadot', 'DOT'),
];

class _CryptoScreenState extends State<CryptoScreen> {
  List<double> list = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: !isLoading
          ? SafeArea(
              child: Column(
                children: [
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
                  Expanded(
                    flex: 2,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [0, 1, 2, 3, 4, 5, 6, 7, 8].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: omega[i],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        color: Color(0xffD2AE6D),
                      ),
                      height: 75.0,
                      width: 300.0,
                      child: TextButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          int errorFlag = 0;
                          if (list.isEmpty || list.length == 1 && (list[0]==-1 || list[0]==-2)) {
                            list = await Crypto('BTC', 'USD').getAllData();
                            if(list[0] == -1 || list[0] == -2) {
                              errorFlag = 1;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return ErrorCondition(list[0].toInt());
                              }));
                            }
                          }
                            setState(() {
                            isLoading = false;
                          });
                          if(errorFlag == 0)
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CryptoConvertor(list);
                          }));
                        },
                        child: Text(
                          'Crypto Convertor',
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: !isLoading
                  ? null
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitCubeGrid(
                          color: Color(0xffD2AE6D),
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          'Setting up the conversion enviornment...',
                          style: TextStyle(
                            color: Color(0xffD2AE6D),
                          ),
                        ),
                      ],
                    )),
    );
  }
}
