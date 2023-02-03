import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

const apikey = '8FF9D1ED-7BDD-4788-AEF9-27A7E4669027';
// const apikey = '052BDA3D-3C66-45B1-B9DC-14129FADDEC7';
// const apikey = 'A648DFE7-A350-4ECE-8AEC-8F6E9C87549C';

class Crypto {
  static List<String> list = ['BTC', 'ETH', 'USDT', 'BUSD', 'ADA', 'DOGE', 'SOL', 'MATIC', 'DOT'];
  Crypto(this.cryptoAbbreviation, this.currency);
  String cryptoAbbreviation;
  String currency;
  late double conversionRate;
  Future<List<double>> getAllData() async{
    List<double> allCryptoUSDConversion = [];
    for(int i=0; i<list.length; i++) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
      }
      else return [-1];
      Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/${list[i]}/USD?apikey=$apikey'));
      var decodedData = jsonDecode(response.body);
      if(decodedData['error'] == 'Too many requests - You have exceeded your API key last 24 hour requests executed limit, please wait for new requests or contact support for upgrading your existing plan or enabling overage.') {
        return [-2];
      }
      allCryptoUSDConversion.add(decodedData['rate']);
    }
    return allCryptoUSDConversion;
  }
  Future<double> getData() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
    else return -1;
    Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$cryptoAbbreviation/$currency?apikey=$apikey'));
    var decodedData = jsonDecode(response.body);
    if(decodedData['error'] == 'Too many requests - You have exceeded your API key last 24 hour requests executed limit, please wait for new requests or contact support for upgrading your existing plan or enabling overage.') {
      return -2;
    }
    double data = decodedData['rate'];
    return data;
  }
}