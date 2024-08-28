

import 'package:flutter/material.dart';

var Main_Color = Color(0xff34568B);
class ReportZemamCard extends StatefulWidget {
  final balance,balance_dn,balance_dl,balance_eu, m_name, m_id, phone;
  

  ReportZemamCard({
    Key? key,
    required this.phone,
    this.balance,
     this.balance_dn,
      this.balance_dl,
       this.balance_eu,
   
    required this.m_id,
    required this.m_name,
  
  }) : super(key: key);

  @override
  State<ReportZemamCard> createState() => _ReportZemamCardState();
}

class _ReportZemamCardState extends State<ReportZemamCard> {

 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
         scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          widget.balance.toString().length > 15
                              ? widget.balance.toString().substring(0, 15) + '...'
                              : widget.balance.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: double.parse( widget.balance.toString()) > 0.0 ?  Colors.red : Colors.green),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          widget.balance_dn.toString().length > 15
                              ? widget.balance_dn.toString().substring(0, 15) + '...'
                              : widget.balance_dn.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: double.parse( widget.balance_dn.toString()) > 0.0 ?  Colors.red : Colors.green),
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          widget.balance_dl.toString().length > 15
                              ? widget.balance_dl.toString().substring(0, 15) + '...'
                              : widget.balance_dl.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: double.parse( widget.balance_dl.toString()) > 0.0 ?  Colors.red : Colors.green),
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          widget.balance_eu.toString().length > 15
                              ? widget.balance_eu.toString().substring(0, 15) + '...'
                              : widget.balance_eu.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: double.parse( widget.balance_eu.toString()) > 0.0 ?  Colors.red : Colors.green),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffDFDFDF),
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          "${widget.m_id}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          "${widget.m_name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffDFDFDF),
                          border: Border.all(color: Color(0xffD6D3D3))),
                      child: Center(
                        child: Text(
                          "${widget.phone}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                 
            
                 
                  
                ],
              ),
            ),
          ),
        
         
        ],
      ),
    );
  }

 
}
