import 'package:flutter/material.dart';
import 'crypto_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff3a3a45),
      backgroundColor: Color(0xff1a1726),
      body: SafeArea(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: double.infinity,
                // ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'C',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xfffcfcff),
                            ),
                          ),
                        ),
                        Text(
                          'R',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'Y',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'P',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'T',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'R',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'A',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'C',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                        Text(
                          'K',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(fontSize: 30.0),
                            color: Color(0xfffcfcff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration(milliseconds: 250),
                        animatedTexts: [
                          RotateAnimatedText(
                            'Welcome to Cryptrack',
                            textStyle: GoogleFonts.oswald(
                              textStyle: TextStyle(fontSize: 15.0),
                              color: Color(0xfffcfcff),
                            ),
                          ),
                          RotateAnimatedText(
                            'Your one stop solution to',
                            textStyle: GoogleFonts.oswald(
                              textStyle: TextStyle(fontSize: 15.0),
                              color: Color(0xfffcfcff),
                            ),
                          ),
                          RotateAnimatedText(
                            'keeping track of different cryptocurrencies.',
                            textStyle: GoogleFonts.oswald(
                              textStyle: TextStyle(fontSize: 15.0),
                              color: Color(0xfffcfcff),
                            ),
                          ),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                      // child: Text(
                      //   'Welcome to Cryptrack! Your one stop solution to keeping track of different cryptocurrencies.',
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 15.0),),
                      // ),
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.black38),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CryptoScreen()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color(0xfffcfcff),
                      fontFamily: 'Horizon',
                    ),
                  ),
                ),
              ],
            ),
        ),
      // appBar: AppBar(
      //   backgroundColor: Colors.lightGreenAccent,
      // ),
      // body: SafeArea(
      //   child: Text('Sample'),
      // ),
    );
  }
}
