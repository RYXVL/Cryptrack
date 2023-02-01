import 'package:flutter/material.dart';
import 'crypto_data_getter.dart';
import 'detailed.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CryptoContainer extends StatefulWidget {
  CryptoContainer(this.cryptoName, this.cryptoAbbreviation);
  String cryptoName;
  String cryptoAbbreviation;
  @override
  State<CryptoContainer> createState() => _CryptoContainerState();
}

class _CryptoContainerState extends State<CryptoContainer> {

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return !isLoading ? Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xff06060a),
      ),
      height: 200.0,
      width: 125.0,
      margin: EdgeInsets.all(5.0),
      // color: Colors.lightGreenAccent,
      child: TextButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          // print('$cryptoName |||||| $cryptoAbbreviation');
          Crypto crypto = Crypto(widget.cryptoAbbreviation, 'USD');
          double temp = await crypto.getData();
          setState(() {
            isLoading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {return Detailed(widget.cryptoName, widget.cryptoAbbreviation, temp);}));
          // print('$temp');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/${widget.cryptoAbbreviation.toLowerCase()}.png',
              height: 50.0,
              width: 50.0,
            ),
            Text('${widget.cryptoName}',
              style: TextStyle(fontSize: 17.0),),
            Text('${widget.cryptoAbbreviation}',
              style: TextStyle(fontSize: 13.0),),
          ],
        ),
      ),
    ) :
    Container(
      height: 200.0,
      width: 125.0,
      child: Center(
        child: !isLoading ? null :SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
          // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        ),
      ),
    );
  }
}
