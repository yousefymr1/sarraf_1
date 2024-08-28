
import 'package:flutter/material.dart';

var Main_Color = Color(0xff34568B);
class KashfCard extends StatefulWidget {
  final  balance, bayan, date,cur_price,currency, action_id;
  var actions;

  KashfCard({
    Key? key,
    required this.action_id,
        required this.currency,
    required this.cur_price,
    required this.date,
    required this.bayan,
    required this.balance,
    required this.actions,
  }) : super(key: key);

  @override
  State<KashfCard> createState() => _KashfCardState();
}

class _KashfCardState extends State<KashfCard> {

 

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        color: Color(0xffDFDFDF),
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
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD6D3D3))),
                    child: Center(
                      child: Text(
                        "${widget.currency}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
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
                        "${widget.cur_price}",
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
                        "${widget.bayan}",
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
                        color: Color(0xffDFDFDF),
                        border: Border.all(color: Color(0xffD6D3D3))),
                    child: Center(
                      child: Text(
                        "${widget.date}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD6D3D3))),
                    child: Center(
                      child: Text(
                        "${widget.action_id}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
       
      ],
    );
  }

 
}
