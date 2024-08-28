import 'package:alquds_sarraf/cur_prices.dart';
import 'package:alquds_sarraf/kashf_hesab.dart';
import 'package:alquds_sarraf/report_mogmal_zemam.dart';
import 'package:alquds_sarraf/report_sanadat.dart';
import 'package:alquds_sarraf/rounded_button.dart';
import 'package:alquds_sarraf/transfer_balance.dart';
import 'package:alquds_sarraf/transfer_report.dart';
import 'package:flutter/material.dart';

import 'package:alquds_sarraf/qabd.dart';

class FirstPage extends StatelessWidget {
  static const String id = 'first_page';
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
 centerTitle: true,
        title:  const Text('القدس للصرافين' ,textAlign: TextAlign.right,
        style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                   RoundedButton(
                 icon: Icons.arrow_back,
                  title: 'اسعار العملات',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () async {
    

                       Navigator.pushNamed(context, CurPrices.id);
                  }),
              RoundedButton(
                 icon: Icons.arrow_back,
                  title: 'تحويل من زبون لاخر',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () async {
    

                       Navigator.pushNamed(context, TransferBalance.id);
                  }),
              RoundedButton(
                  icon: Icons.arrow_back,
                  title: 'قبض',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                    Navigator.pushNamed(context, AddQabd.id, arguments: {
                                      'a_code': "2"
                                    },);
                  }),
                  RoundedButton(
                      icon: Icons.arrow_back,
                  title: 'صرف',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                     Navigator.pushNamed(context, AddQabd.id, arguments: {
                                      'a_code': "1"
                                    },);
                  }),
             RoundedButton(
                icon: Icons.arrow_back,
                  title: 'كشف حساب',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                        Navigator.pushNamed(context, KashfHesab.id);
                  }),
                    RoundedButton(
                        icon: Icons.arrow_back,
                  title: 'مجمل الذمم',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                    Navigator.pushNamed(context, ZemamReport.id);
                  }),
                   RoundedButton(
                      icon: Icons.arrow_back,
                  title: 'مجمل القبض',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                    Navigator.pushNamed(context, SanadatReport.id, arguments: {
                                      'a_code': "2"
                                    },);
                  }),
                   RoundedButton(
                      icon: Icons.arrow_back,
                  title: 'مجمل الصرف',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                
                    Navigator.pushNamed(context, SanadatReport.id, arguments: {
                                      'a_code': "1"
                                    },);
                  }),
                    RoundedButton(
                      icon: Icons.arrow_back,
                  title: 'مجمل التحويلات',
                  colour: Color.fromRGBO(58, 66, 86, 1.0),
                  onPressed: () {
                
                           Navigator.pushNamed(context, TransferReport.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
