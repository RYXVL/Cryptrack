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
        // color: Color(0xff06060a),
        color: Color(0xffD2AE6D),
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
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('${widget.cryptoName}',
              style: TextStyle(fontSize: 30.0,color: Colors.white,),),
            Text('${widget.cryptoAbbreviation}',
              style: TextStyle(fontSize: 15.0,color: Colors.white,),),
          ],
        ),
      ),
    ) :
    Container(
      height: 200.0,
      width: 125.0,
      child: Center(
        child: !isLoading ? null :SpinKitCubeGrid(
          color: Color(0xffD2AE6D),
          size: 50.0,
          // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        ),
      ),
    );
  }
}
