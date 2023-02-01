import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
      Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/${list[i]}/USD?apikey=$apikey'));
      // print(response.body);
      var decodedData = jsonDecode(response.body);
      // print(decodedData['rate']);
      allCryptoUSDConversion.add(decodedData['rate']);
    }
    // print('final data: $data');
    return allCryptoUSDConversion;
  }
  Future<double> getData() async{
    Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$cryptoAbbreviation/$currency?apikey=$apikey'));
    var decodedData = jsonDecode(response.body);
    double data = decodedData['rate'];
    // print('final data: $data');
    return data;
  }

}