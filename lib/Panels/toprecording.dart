import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/screens/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

 
class TopRecordedPanel extends StatefulWidget {
  @override
  _TopRecordedPanelState createState() => _TopRecordedPanelState();
}

class _TopRecordedPanelState extends State<TopRecordedPanel> {

  bool progress = false;
  List topRecorded;
  fetchCountryDataCases() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=$top5case');
    setState(() {
      topRecorded = json.decode(response.body);
      progress = false;
      reload = false;
    });

    print('fetchData called rty');
  }

   Future fetchData() async{
    fetchCountryDataCases();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ((topRecorded == null)|| (progress))?Container(height:20,child: Center(child: SpinKitWave(color: Colors.grey[900],))):
    Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if(reload){
            fetchData();
              progress = true;
          }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                Image.network(
                  topRecorded[index]['countryInfo']['flag'],
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  topRecorded[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$top5type:' + topRecorded[index]['$top5case'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}