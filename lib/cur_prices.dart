import 'dart:convert';
import 'dart:io';

import 'package:alquds_sarraf/kashf_hesab.dart';
import 'package:alquds_sarraf/report_mogmal_zemam.dart';
import 'package:alquds_sarraf/report_sanadat.dart';
import 'package:alquds_sarraf/rounded_button.dart';
import 'package:alquds_sarraf/transfer_balance.dart';
import 'package:alquds_sarraf/transfer_report.dart';
import 'package:flutter/material.dart';

import 'package:alquds_sarraf/qabd.dart';
final TextEditingController dl = TextEditingController();
final TextEditingController dn = TextEditingController();
final TextEditingController eu = TextEditingController();
final TextEditingController cur_Date = TextEditingController();
  List _loadedPhotos = [];
  List _loadedPhotos2 = [];

class CurPrices extends StatefulWidget {
  static const String id = 'cur_prices';
  CurPrices({Key? key}) : super(key: key);

  @override
  State<CurPrices> createState() => _CurPricesState();
}

class _CurPricesState extends State<CurPrices> {


  Future<void> _fetchData() async {
   
_loadedPhotos = [];
_loadedPhotos2 = [];

    var apiUrl =
        'https://jerusalemaccounting.yaghco.website/gold/curruncypricesjson.php';
    print(apiUrl);
    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content) ?? [];
     
if(this.mounted) {
  setState(() {
     print(data);
     dl.text = double.parse(data[0]["shekel"]).toStringAsFixed(3);
     dn.text = (1 / ((1.0 / ((1.00 / double.parse( data[0]["dennar"])))) /(1 / ((1.00 / double.parse(data[0]["shekel"])))))).toStringAsFixed(3);
    
     eu.text =  (1 / ((1.0 / ((1.00 / double.parse( data[0]["euro"])))) /(1 / ((1.00 / double.parse(data[0]["shekel"])))))).toStringAsFixed(3);
    cur_Date.text =  DateTime.now().toString();
    });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        centerTitle: true,
        title: const Text('القدس للصرافين',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
          const SizedBox(height: 30),
        Text(
          "أسعار العملات",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        //Text("Enter your credential to login"),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _inputField(context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       
        
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'الدينار :',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                     readOnly:  true,
                  controller: dn,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.currency_exchange),
                  ),
                  // obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'الدولار :',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                     readOnly:  true,
                  controller: dl,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.currency_exchange),
                  ),
                  // obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'اليورو :',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  readOnly:  true,
                  controller: eu,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.currency_exchange),
                  ),
                  // obscureText: true,
                ),
              ),
            ],
          ),
            const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'تاريخ اخر تحديث :',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  readOnly:  true,
                  controller: cur_Date,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                 
                  ),
                  // obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
             _fetchData();
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            ),
            child: const Text(
              "تحديث",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
