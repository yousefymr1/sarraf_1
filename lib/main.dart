import 'package:alquds_sarraf/admin_screen.dart';
import 'package:alquds_sarraf/cur_prices.dart';

import 'package:alquds_sarraf/kashf_hesab.dart';
import 'package:alquds_sarraf/transfer_balance.dart';
import 'package:alquds_sarraf/transfer_report.dart';
import 'package:flutter/material.dart';
import 'package:alquds_sarraf/welcome_page.dart';
import 'package:alquds_sarraf/first_page.dart';

import 'package:alquds_sarraf/qabd.dart';
import 'package:alquds_sarraf/report_sanadat.dart';
import 'package:alquds_sarraf/report_mogmal_zemam.dart';
void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
     
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        FirstPage.id: (context) => FirstPage(),
       WelcomeScreen.id: (context) => WelcomeScreen(),
        
                AddQabd.id: (context) => AddQabd(),
                  KashfHesab.id: (context) => KashfHesab(),
                    SanadatReport.id: (context) => SanadatReport(),
                     ZemamReport.id: (context) => ZemamReport(),
                     AdminScreen.id: (context) => AdminScreen(),
                      TransferBalance.id: (context) => TransferBalance(),
                          TransferReport.id: (context) => TransferReport(),
                            CurPrices.id: (context) => CurPrices(),
                           
      },
    );
  }
}
