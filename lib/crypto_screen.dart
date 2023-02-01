import 'package:flutter/material.dart';
import 'crypto_container.dart';
import 'crypto_convertor.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'crypto_data_getter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'caro';
import 'package:carousel_slider/carousel_slider.dart';

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
      // backgroundColor: Color(0xff7b7b85),
      // backgroundColor: Color(0xffbbbbc4),
      // backgroundColor: Color(0xffe4e2f2),
      // backgroundColor: Color(0xff585862),
      // // backgroundColor: Color(0xff3a3a45),
      backgroundColor: Colors.white,
      body: !isLoading ? SafeArea(child: Column(
        children: [
      Expanded(
        child: Hero(
          tag: 'logo',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/phoenix.png"),
                // scale: 3.0,
                // fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
          Expanded(
            flex: 2,
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0, autoPlay: true, autoPlayInterval: Duration(seconds: 2),),
              items: [0, 1, 2, 3, 4, 5, 6, 7, 8].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          // decoration: BoxDecoration(
                          //     color: Colors.amber
                          // ),
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
              borderRadius: BorderRadius.all(Radius.circular(5.0),),
              color: Color(0xffD2AE6D),
            ),
            // color: Color(0xffD2AE6D),
            height: 75.0,
            width: 300.0,
            child: TextButton(
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
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Color(0xff7b7b85)),
              // ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText('Crypto Convertor',
                    textStyle: TextStyle(color: Colors.white, fontSize: 30.0),),
                  // FadeAnimatedText('do it RIGHT!!'),
                  // FadeAnimatedText('do it RIGHT NOW!!!'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
              // child: Text(
              //   'Crypto Convertor',
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
          ),
        ),
        ],
      ))
      // SafeArea(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     // crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Expanded(
      //         child: Hero(
      //           tag: 'logo',
      //           child: Container(
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage("images/phoenix.png"),
      //                 // fit: BoxFit.fill,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           CryptoContainer('Bitcoin', 'BTC'),
      //           CryptoContainer('Ethereum', 'ETH'),
      //           CryptoContainer('Tether', 'USDT'),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           CryptoContainer('Binance USD', 'BUSD'),
      //           CryptoContainer('Cardano', 'ADA'),
      //           CryptoContainer('Dogecoin', 'DOGE'),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           CryptoContainer('Solana', 'SOL'),
      //           CryptoContainer('Polygon', 'MATIC'),
      //           CryptoContainer('Polkadot', 'DOT'),
      //         ],
      //       ),
      //       TextButton(
      //         onPressed: () async {
      //           setState(() {
      //             isLoading = true;
      //           });
      //           if(list.isEmpty)
      //             list = await Crypto('BTC', 'USD').getAllData();
      //           setState(() {
      //             isLoading = false;
      //           });
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {return CryptoConvertor(list);}));
      //         },
      //         style: ButtonStyle(
      //           backgroundColor: MaterialStateProperty.all(Color(0xff7b7b85)),
      //         ),
      //         child: Text(
      //           'Crypto Convertor',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     ],
      //   ),
      // ) :
      :
      Center(
      child: !isLoading ? null : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Color(0xffD2AE6D),
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
