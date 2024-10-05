import 'dart:convert';
import 'dart:io';

import 'package:alquds_sarraf/kashf_card.dart';
import 'package:alquds_sarraf/rounded_button.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
var Main_Color = Color(0xff34568B);
final TextEditingController m_name_controller = TextEditingController();
final TextEditingController m_id = TextEditingController();
final TextEditingController _controller = TextEditingController();

bool v = false;
List _loadedcust = [];
  List _loadedcust2 = [];
var focusNode1 = FocusNode();
int fill = 0;
double blnc = 0;
double blnc_dn = 0;
double blnc_dl = 0;
double blnc_eu = 0;

class KashfHesab extends StatefulWidget {
  
    static const String id = 'kashf_hesab';
  KashfHesab({Key? key}) : super(key: key);

  @override
  State<KashfHesab> createState() => _KashfHesabState();
}

class _KashfHesabState extends State<KashfHesab> {

List _loadedPhotos = [];
 
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _loadedcust;
    } else {
      results = _loadedcust
          .where((user) => user["name"].contains(enteredKeyword))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _loadedcust2 = results;
      print(enteredKeyword);
      print(results);
    });
    // setupAlertDialoadContainer(context);
  }

  Future<void> _fetchData() async {
    if(m_id.text != ""){
    var m_id2 = m_id.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
String? company_id = prefs.getString("company_id");
    var apiUrl =
        'https://yaghm.com/jerusalemaccounting/sarraf/get_kashf.php?allow=yes&m_id=$m_id2';
    print(apiUrl);
    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content) ?? [];

    setState(() {
      _loadedPhotos = data;
      print(_loadedPhotos);
      blnc = 0;
      blnc_dn = 0;
       blnc_dl = 0;
        blnc_eu = 0;
      for (var i = 0; i < _loadedPhotos.length; i++) {
        if( _loadedPhotos[i]['currency'].toString() == "شيكل")
       blnc += double.parse( _loadedPhotos[i]['balance'].toString());
       else if( _loadedPhotos[i]['currency'].toString() == "دينار")
       blnc_dn += double.parse( _loadedPhotos[i]['balance'].toString());
         else if( _loadedPhotos[i]['currency'].toString() == "دولار")
       blnc_dl += double.parse( _loadedPhotos[i]['balance'].toString());
         else if( _loadedPhotos[i]['currency'].toString() == "يورو")
       blnc_eu += double.parse( _loadedPhotos[i]['balance'].toString());
      }
      print("_loadedPhotos");
    });
    }
  }

  
  Future<void> _fetchCust() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

    var apiUrl =
        'https://yaghm.com/jerusalemaccounting/sarraf/get_custs.php?allow=yes';
    print(apiUrl);
    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content) ?? [];

    setState(() {
      _loadedcust = data;
      print(_loadedcust);
     _loadedcust2 = data;
      print("_loadedcust");
    });
  }


  @override
  Widget build(BuildContext context) {
    
    if (fill == 0) {
      //_fetchData();
         _fetchCust();
      fill = 1;
    }
    return PopScope(
      canPop: true,
       onPopInvoked : (didPop) {
//fill = 0;
setState(() {
 
  m_name_controller.text = "";
  //fill = 0;
 blnc = 0;
        blnc_dn = 0;
       blnc_dl = 0;
        blnc_eu = 0;
     
});
return ;
       },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          centerTitle: true,
          title: const Text('كشف حساب', textAlign: TextAlign.right,
        style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child:  Directionality(
        textDirection: TextDirection.rtl,
            child: Column(
              children: [
                 Visibility(
              visible: false,
              child: TextField(
                
                enabled: false,
                controller: m_id,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    hintText: "رقم الزبون",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
                  const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'اسم الزبون :',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  onTap: () {
                    setState(() {
                      _controller.text = "";
                      _runFilter("");
                      v = true;
                      focusNode1.requestFocus();
                      fill = 0;
                    });
                  },
                  controller: m_name_controller,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "اسم الزبون",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  // obscureText: true,
                ),
              ),
            ],
          ),
          Visibility(
            visible: v,
            child: Container(
                height: 300.0, // Change as per your requirement
                width: 300.0, // Change as per your requirement
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextField(
                      focusNode: focusNode1,
                      controller: _controller,
                      autofocus: true,
                      onChanged: (value) => _runFilter(value),
                      decoration: const InputDecoration(
                          labelText: 'بحث', suffixIcon: Icon(Icons.search)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _loadedcust.isEmpty
                          ? Center(
                              child: ElevatedButton(
                                onPressed: (_fetchCust),
                                child: const Text('loading...'),
                              ),
                            )
                          // The ListView that displays photos
                          : ListView.builder(
                              itemCount: _loadedcust2.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border(top: BorderSide())),
                                  child: ListTile(
                                    leading: Text(
                                      _loadedcust2[index]["id"],
                                    ),
                                    title:
                                        Text(_loadedcust2[index]['name']),
                                    onTap: () {
                                      m_name_controller.text =
                                          _loadedcust2[index]["name"];

                                      m_id.text = _loadedcust2[index]['id'];
                                      //phone_controller.text =
                                      
                                      setState(() {
                                        v = false;
                                      });
                                      // Navigator.of(context).pop(false);
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                )),
          ),
                 Directionality(
        textDirection: TextDirection.ltr,
            child: 
                      RoundedButton(
                         icon: Icons.search,
                        title: 'بحث',
                        colour: Color.fromRGBO(58, 66, 86, 1.0),
                        onPressed: () {
                          _fetchData();
                        }),
                  
                  ),
                      Column(
                      children: [
                       Row(
                         children: [
                           Text(' شيكل :', textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                 SizedBox(width: 20,),
                                                  Text(  blnc.toString(), textAlign: TextAlign.right,
                                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                                                  color:  blnc > 0.0 ?  Colors.red : Colors.green)),
                         
                         ],
                       ),
                          Row(
                            children: [
                              Text('دينار :', textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 20,),
                         Text(  blnc_dn.toString(), textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                                                  color:  blnc_dn > 0.0 ?  Colors.red : Colors.green)),
                            ],
                          ),
                     
                           Row(
                             children: [
                               Text(' دولار :', textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             SizedBox(width: 20,),
                         Text(  blnc_dl.toString(), textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                                                  color:  blnc_dl > 0.0 ?  Colors.red : Colors.green)),
                             ],
                           ),
                     
                           Row(
                             children: [
                               Text(' يورو :', textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 20,),
                         Text(  blnc_eu.toString(), textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                                                  color:  blnc_eu > 0.0 ?  Colors.red : Colors.green)),
                             ],
                           ),
                     
                      ],
                    ),
                Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
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
                                            gradient: LinearGradient(colors: [
                                                 Color.fromRGBO(65, 108, 216, 1),
                                              Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "المبلغ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                            Color.fromRGBO(58, 66, 86, 1.0),
                                         Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "العملة",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                             Color.fromRGBO(58, 66, 86, 1.0),
                                         Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "سعر التحويل",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                                 Color.fromRGBO(65, 108, 216, 1),
                                              Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "البيان",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                                Color.fromRGBO(65, 108, 216, 1),
                                              Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "التاريخ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                                Color.fromRGBO(65, 108, 216, 1),
                                              Color.fromRGBO(58, 66, 86, 1.0),
                                            ]),
                                            border:
                                                Border.all(color: Color(0xffD6D3D3))),
                                        child: Center(
                                          child: Text(
                                            "رقم السند",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
            
              ListView.builder(
                
                   scrollDirection: Axis.vertical,
          shrinkWrap: true,
            physics: const ClampingScrollPhysics(), 
                itemCount: _loadedPhotos.length,
            itemBuilder: (BuildContext context, int index) { 
              DateTime f = DateTime.parse(_loadedPhotos[index]['q_date']);
                String sDate=   "${f.year.toString()}-${f.month.toString().padLeft(2,'0')}-${f.day.toString().padLeft(2,'0')}";
   
                  return KashfCard(
                                        actions: "'action'",
                                        action_id: _loadedPhotos[index]['id'] ?? "",
                                        balance: _loadedPhotos[index]['balance'] ?? "",
                                        bayan: _loadedPhotos[index]['bayan'] ?? "",
                                           currency: _loadedPhotos[index]['currency'],
                                            cur_price: _loadedPhotos[index]['cur_price'],
                                        date: sDate ?? "",
                                        
                                      );
                }, 
              ),
                                    ],
            ),
          ),
          ),
        
      ),
    );
  }
}